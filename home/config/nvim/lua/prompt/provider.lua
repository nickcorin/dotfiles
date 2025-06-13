local default_config = require("prompt.config").defaults

-- Refactored code to remove duplicate annotations by using inheritance for ProviderOptions in Provider

---@class ProviderOptions
---@field api_key? string The API key to use for the assistant.
---@field api_key_var? string The environment variable containing an API key.
---@field base_url string The URL to use for the assistant.
---@field max_completion_tokens? number The maximum number of tokens to generate for completions.
---@field model string The model to use for the assistant.
---@field system_prompt? string The system-level prompt sent with all requests.
---@field temperature? number The temperature to use for the assistant, between 0 and 1.
---@field request_timeout? number The timeout to use for requests, in milliseconds.

---@class Provider: ProviderOptions
local Provider = {}

---@param opts ProviderOptions
---@return Provider
function Provider:new(opts)
    opts = vim.tbl_deep_extend("force", default_config.providers["*"], opts or {})
    local provider = setmetatable(opts, { __index = self })

    -- Overwrite the api key if the environment variable is set.
    if provider.api_key_var and provider.api_key_var ~= "" then
        provider.api_key = os.getenv(provider.api_key_var)
    end

    vim.validate({
        api_key = { provider.api_key, "string", false, "either `api_key` or `api_key_var` must be set" },
        base_url = { provider.base_url, "string", false, "`api_url` must be set" },
        model = { provider.model, "string", false, "`model` must be set" },
        system_prompt = { provider.system_prompt, "string", false, "`system_prompt` must be set" },
        temperature = { provider.temperature, "number", false, "`temperature` must be set" },
    })

    return provider
end

---@param prompt string
---@return table
function Provider:build_request(prompt)
    error("method 'build_request' not implemented, forget to do it? lol")
    return {}
end

---@return string
function Provider:name()
    error("method 'name' not implemented, forget to do it? lol")
    return ""
end

---@param data? string
---@return string
function Provider:parse_response(data)
    error("method 'parse_response' not implemented, forget to do it? lol")
    return ""
end

---@param prompt string
---@param callback fun(chunk: string)
function Provider:stream_chat_completion(prompt, callback)
    error("method 'stream_chat_completion' not implemented, forget to do it? lol")
end

return Provider
