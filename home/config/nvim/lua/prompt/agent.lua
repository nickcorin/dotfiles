local curl = require("plenary.curl")
local utils = require("prompt.utils")

local Sidebar = require("prompt.sidebar")
local ChatLog = require("prompt.chat_log")
local default_config = require("prompt.config").defaults

---@class Agent
---@field sidebar Sidebar
---@field provider Provider
---@field history ChatLog
local Agent = {}

---@return Agent
function Agent:new(opts)
    opts = vim.tbl_deep_extend("force", default_config, opts or {})

    if not opts.providers[opts.provider] then
        error("agent: unsupported provider: `" .. opts.provider .. "`.")
    end

    local ok, pModule = pcall(require, "prompt." .. opts.provider)
    if not ok then
        error("agent: provider module not found: `" .. opts.provider .. "`.")
    end

    local provider = pModule:new(opts.providers[opts.provider])
    local history = ChatLog:from_file(utils.interpolate_string(opts.history.logfile, { provider = provider:name() }))

    local agent = setmetatable({
        history = history,
        provider = provider,
    }, { __index = self })

    -- This must sit outside the initial `setmetatable` call, as it would otherwise
    -- be self-referential.
    agent.sidebar = Sidebar:new(vim.tbl_deep_extend("force", opts.sidebar, {
        prompt = {
            callback = function(prompt) agent:handle_prompt(prompt) end,
        },
    }))

    return agent
end

function Agent:handle_prompt(prompt)
    if not prompt or prompt == "" then
        vim.notify("agent: empty prompt.", vim.log.levels.WARN)
        return
    end

    self.history:append({
        role = "user",
        content = prompt,
    })

    self.sidebar:stream_to_chat("you: ", "Question")
    self.sidebar:stream_to_chat(prompt)

    self.sidebar:stream_to_chat(self.provider:name() .. ": \n", "Title")
    local chunks = {}
    self:stream_chat_completions(prompt, function(chunk)
        table.insert(chunks, chunk)
        vim.schedule(function() self.sidebar:stream_to_chat(chunk) end)
    end)

    self.history:append({
        role = "assistant",
        content = table.concat(chunks, ""),
    })

    self.history:to_file(self.provider:name() .. ".json")
end

---@param prompt string
---@param callback fun(data: string)
function Agent:stream_chat_completions(prompt, callback)
    -- TODO: add context with the prompt.
    local req = self.provider:build_request(prompt)

    -- `-s` enables silent mode, and supresses progress logs being sent to stderr.
    -- `-N` disables response buffering.
    req.raw = vim.list_extend({ "-s", "-N" }, req.raw or {})

    req.stream = function(err, chunk, _)
        if err then
            error("agent: curl request to `" .. self.provider:name() .. "` bombed: " .. err)
        end

        if not chunk then
            error("agent: curl request to `" .. self.provider:name() .. "` bombed: no chunk")
        end

        local event_chunk = chunk:match("^event: (.+)$")
        if event_chunk then
            vim.notify("event chunk: " .. event_chunk, vim.log.levels.INFO)
            return
        end

        local data_chunk = chunk:match("^data: (.+)$")
        if data_chunk then
            callback(self.provider:parse_response(data_chunk))
        end
    end

    local res = curl.request(req)
    if res.exit ~= 0 or res.status > 299 then
        error("agent: curl request bombed: status code: `" .. res.status .. "`, exit code: `" .. res.exit .. "`")
    end
end

return Agent
