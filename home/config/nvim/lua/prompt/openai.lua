local Provider = require("prompt.provider")
local default_config = require("prompt.config").defaults

---@class OpenAIProvider : Provider
local OpenAIProvider = setmetatable({}, { __index = Provider })

---@param opts ProviderOptions
---@return Provider
function OpenAIProvider:new(opts)
    opts = vim.tbl_deep_extend("force", default_config.providers.openai, opts or {})
    local super = Provider:new(opts)
    return setmetatable(super, { __index = self })
end

---@param prompt string
---@return table
function OpenAIProvider:build_request(prompt)
    local payload = {
        max_completion_tokens = self.max_completion_tokens,
        model = self.model,
        stream = true,
        temperature = self.temperature,
        messages = {
            {
                role = "developer",
                content = self.system_prompt,
            },
            {
                role = "user",
                content = prompt,
            },
        },
    }

    return {
        url = self.base_url .. "/chat/completions",
        method = "POST",
        timeout = self.request_timeout,
        headers = {
            ["Accept"] = "application/json",
            ["Authorization"] = "Bearer " .. self.api_key,
            ["Content-Type"] = "application/json",
        },
        body = vim.fn.json_encode(payload),
    }
end

---@return string
function OpenAIProvider:name()
    return "openai"
end

---@param data string
---@return string
function OpenAIProvider:parse_response(data)
    if data:match("%[DONE]%s*$") then
        return ""
    end

    local ok, decoded = pcall(vim.json.decode, data)
    if not ok then
        error("openai: error decoding stream chunk: " .. data, vim.log.levels.ERROR)
        return ""
    end

    local content = decoded.choices and decoded.choices[1] and decoded.choices[1].delta.content
    return (content ~= nil) and content or ""
end

return OpenAIProvider
