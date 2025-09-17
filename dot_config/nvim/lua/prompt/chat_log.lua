local default_config = require("prompt.config").defaults

---@alias Message {role: string, content: string}
---
---@class ChatLog
---@field messages Message[]
---@field source string
local ChatLog = {}

---@return ChatLog
function ChatLog:new(opts)
    opts = opts or {}

    local chat_log = setmetatable({
        messages = opts.messages or {},
        source = opts.source,
    }, { __index = self })
    return chat_log
end

---@param msg Message
function ChatLog:append(msg)
    table.insert(self.messages, msg)
end

function ChatLog:clear()
    self.messages = {}
end

---@param filepath string
---@return ChatLog
function ChatLog:from_file(filepath)
    local parent_dir = filepath:match("(.*/)")
    if parent_dir and vim.loop.fs_stat(parent_dir) == nil then
        local ok, err = vim.loop.fs_mkdir(parent_dir, 493)
        if not ok or err then
            error("chat_log: unable to create directory: " .. parent_dir .. "\nError: " .. err)
        end
    end

    -- Ensure that the logfile exists.
    if vim.loop.fs_stat(filepath) == nil then
        local f, err = io.open(filepath, "w")
        if not f then
            error("chat_log: unable to create logfile: " .. filepath .. "\nError: " .. err)
        end
        f:close()
    end

    local f = io.open(filepath, "r")
    if not f then
        error("chat_log: unable to open logfile: " .. filepath)
    end

    local content = f:read("*all")
    f:close()

    return ChatLog:new({
        messages = self:decode(content),
        source = filepath,
    })
end

function ChatLog:to_file(filepath)
    local f = io.open(filepath, "w")
    if not f then
        vim.notify("chat_log: unable to open file: " .. filepath)
        return
    end

    f:write(self:encode(self.messages))
    f:close()
end

---@param message Message
---@return Message
function ChatLog:sanitize_message(message)
    return {
        role = message.role,
        content = message.content,
    }
end

---@param messages Message[]
---@return string
function ChatLog:encode(messages)
    if not messages or #messages == 0 then
        return ""
    end

    local sanitized = {}
    for _, msg in ipairs(messages) do
        table.insert(sanitized, self:sanitize_message(msg))
    end

    return vim.fn.json_encode(sanitized)
end

---@param raw string
---@return Message[]
function ChatLog:decode(raw)
    if not raw or raw == "" then
        return {}
    end

    local messages = {}

    local records = vim.fn.json_decode(raw)
    for _, record in ipairs(records) do
        table.insert(messages, self:sanitize_message(record))
    end

    return messages
end

return ChatLog
