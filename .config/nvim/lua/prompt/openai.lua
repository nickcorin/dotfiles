local Provider = require("prompt.provider")

---@class OpenAIProvider : Provider
local OpenAIProvider = setmetatable({}, { __index = Provider })

---@param opts ProviderOptions
---@return Provider
function OpenAIProvider:new(opts)
    local defaults = {
        api_url = "https://api.openai.com/v1/chat/completions",
        model = "gpt-4o",
    }

    opts = vim.tbl_deep_extend("force", defaults, opts or {})
    local super = Provider:new(opts)
    return setmetatable(super, { __index = self })
end

---@param ctx PromptContext
---@param prompt string
---@return table
function OpenAIProvider:build_request(ctx, prompt)
    local content = table.concat(ctx.content, "\n")
    local payload = {
        model = self.model,
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
            {
                role = "user",
                content = ctx.file,
            },
            {
                role = "user",
                content = content,
            },
        },
        prediction = {
            type = "content",
            content = content,
        },
    }

    return {
        url = self.api_url,
        method = "POST",
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
---@return string[]
function OpenAIProvider:parse_response(data)
    local ok, decoded = pcall(vim.json.decode, data)
    if not ok then
        error("openai: error decoding response: " .. data, vim.log.levels.ERROR)
        return {}
    end

    local content = decoded.choices and decoded.choices[1] and decoded.choices[1].message.content
    if not content then
        error("openai: response does not contain valid content", vim.log.levels.ERROR)
        return {}
    end

    return vim.split(content, "\n")
end

return OpenAIProvider
