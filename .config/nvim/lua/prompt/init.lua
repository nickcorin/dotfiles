local Assistant = require("prompt.assistant")
local OpenAIProvider = require("prompt.openai")

--[[
{
    "nickcorin/llm.nvim,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/nui.nvim",
    },
    opts = {
        provider = "openai",
        provider_opts = {
            api_key_var = "OPENAI_API_KEY",
            model = "gpt-4o",
        },
    },
}
]] --

local M = {
    providers = {
        openai = OpenAIProvider,
    }
}

---@class PromptOptions
---@field provider string
---@field provider_opts ProviderOptions
---@field assistant_opts AssistantOptions

---@param opts PromptOptions
function M.setup(opts)
    local factory = M.providers[opts.provider]
    if not factory then
        error("prompt.nvim: unregistered provider: `" .. opts.provider .. "`")
        return
    end

    local ass = Assistant:new(factory:new(opts.provider_opts), opts.assistant_opts)

    vim.api.nvim_create_user_command("Ass", function(cmd) ass:spawn(cmd) end, {
        range = "%",
        nargs = "?",
    })
end

return M
