-- Refactored code to remove duplicate annotations by using inheritance for ProviderOptions in Provider

---@class ProviderOptions
---@field api_key? string The API key to use for the assistant.
---@field api_key_var? string The environment variable containing an API key.
---@field api_url string The URL to use for the assistant.
---@field model string The model to use for the assistant.
---@field system_prompt? string The system-level prompt sent with all requests.
---@field temperature? number The temperature to use for the assistant, between 0 and 1.

---@class Provider: ProviderOptions
local Provider = {}

---@param opts ProviderOptions
---@return Provider
function Provider:new(opts)
    local provider = setmetatable({}, { __index = self })

    local defaults = {
        system_prompt = "help, i suck at programming. :(",
        temperature = 0.7,
    }

    opts = vim.tbl_deep_extend("force", defaults, opts or {})
    for k, v in pairs(opts) do
        provider[k] = v
    end

    -- Overwrite the api key if the environment variable is set.
    if provider.api_key_var and provider.api_key_var ~= "" then
        provider.api_key = os.getenv(provider.api_key_var)
    end

    vim.validate({
        api_key = { provider.api_key, "string", false, "either `api_key` or `api_key_var` must be set" },
        api_url = { provider.api_url, "string", false, "`api_url` must be set" },
        model = { provider.model, "string", false, "`model` must be set" },
        system_prompt = { provider.system_prompt, "string", false, "`system_prompt` must be set" },
        temperature = { provider.temperature, "number", false, "`temperature` must be set" },
    })

    return provider
end

---@param ctx PromptContext
---@param prompt string
---@return table
function Provider:build_request(ctx, prompt)
    error("method 'build_request' not implemented, forget to do it? lol")
    return {}
end

---@return string
function Provider:name()
    error("method 'name' not implemented, forget to do it? lol")
    return ""
end

---@param data? string
---@return string[]
function Provider:parse_response(data)
    error("method 'parse_response' not implemented, forget to do it? lol")
    return {}
end

return Provider
