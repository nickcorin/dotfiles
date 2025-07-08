rockspec_format = "3.0"
package = "prompt.nvim"

local _MODREV, _SPECREV = "scm", "1"
version = _MODREV .. "-" .. _SPECREV

description = {
    summary = "A fast and minimal prompt for Neovim",
    detailed = [[
    A fast and minimal prompt for Neovim, written in Lua.
    ]],
    license = "MIT",
    homepage = "",
    issues_url = "https://github.com/nickcorin/prompt.nvim/issues",
    labels = { "neovim", "plugin", "llm", "prompt" },
}

dependencies = {
    "lua >= 5.1",
    "plenary.nvim",
    "nui-components.nvim",
}

source = {
    url = "git://github.com/nickcorin/prompt.nvim.git",
}
