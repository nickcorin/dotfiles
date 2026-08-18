-----------------------------------------------------------------------------------------------------------------------
-- [[ Lazy Config. ]]
-----------------------------------------------------------------------------------------------------------------------
-- NOTE: Lazy.nvim will automatically load the following files *after* it's own:
--   - `lua/config/autocmds.lua`
--   - `lua/config/keymaps.lua`
--   - `lua/config/options.lua`

local dotfiles_dir = assert(vim.env.DOTFILES_DIR, "DOTFILES_DIR must be set")

require("lazy").setup({
	change_detection = {
		enabled = true,
		notify = true,
	},
	checker = {
		enabled = true,
		notify = true,
	},
	install = {
		missing = true,
	},
	lockfile = vim.fs.joinpath(dotfiles_dir, "dot_config", "nvim", "lazy-lock.json"),
	rocks = {
		enabled = false,
	},
	spec = {
		{ import = "plugins" },
	},
})
