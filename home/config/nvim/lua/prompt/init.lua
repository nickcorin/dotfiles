local Agent = require("prompt.agent")
local default_config = require("prompt.config").defaults

local M = {}

function M.setup(opts)
    opts = vim.tbl_deep_extend("force", default_config, opts or {})

    local agent = Agent:new()
    vim.api.nvim_create_user_command("AgentToggle", function() agent.sidebar:toggle() end, {})

    -- vim.api.nvim_create_user_command("Ass", function(cmd) ass:spawn(cmd) end, {
    --     range = "%",
    --     nargs = "?",
    -- })
end

return M
