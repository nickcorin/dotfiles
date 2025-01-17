local utils = {}


--- Get the root directory of the current project.
--- Use Neovim's built-in LSP to get the project root, or default to the current working directory.
---
---@return string
function utils.get_project_root()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
        if client.config.root_dir then
            return client.config.root_dir
        end
    end

    return vim.fn.getcwd()
end

return utils
