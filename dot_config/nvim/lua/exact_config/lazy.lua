
-----------------------------------------------------------------------------------------------------------------------
-- [[ Lazy Config. ]]
-----------------------------------------------------------------------------------------------------------------------
-- NOTE: Lazy.nvim will automatically load the following files *after* it's own:
--   - `lua/config/autocmds.lua`
--   - `lua/config/keymaps.lua`
--   - `lua/config/options.lua`

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
	spec = {
		{ import = "plugins" },
	},
})
