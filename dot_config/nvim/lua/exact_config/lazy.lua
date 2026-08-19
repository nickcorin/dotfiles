-- Lazy configuration.
-- Defaults: https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/config.lua

local dotfiles_dir = assert(vim.env.DOTFILES_DIR, "DOTFILES_DIR must be set")
local theme = require("config.theme")

theme.apply_local()

require("lazy").setup({
	checker = {
		enabled = true,
	},
	lockfile = vim.fs.joinpath(dotfiles_dir, "dot_config", "nvim", "lazy-lock.json"),
	rocks = {
		enabled = false,
	},
	spec = {
		{ import = "plugins" },
	},
})
