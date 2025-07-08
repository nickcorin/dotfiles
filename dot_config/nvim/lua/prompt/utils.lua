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

--- Interpolate a string with keyed variables, templated as `{{key}}`.
---
---@param s string
---@param vars table
---@return string
function utils.interpolate_string(s, vars)
    if not s or s == "" then
        return s
    end

    if not vars or vim.tbl_isempty(vars) then
        return s
    end

    return (s:gsub("{{(.-)}}", function(key)
        key = key:match("^%s*(.-)%s*$")

        return vars[key] or ("{{" .. key .. "}}")
    end))
end

return utils
