local zen = require"true-zen"

zen.setup {
	modes = {
		ataraxis = {
			minimum_writing_area = {
				width = 120,
			}
		}
	}
}

local keys = {
	-- Insert mode.
	i = {},

	-- Normal mode.
	n = {
		{"<leader>c", ":TZNarrow<CR>"},
		-- {"", ":TZFocus<CR>"},
		{"<leader>m", ":TZMinimalist<CR>"},
		{"<leader>z", ":TZAtaraxis<CR>"},
	},

	-- Visual / select mode.
	v = {
		{"<leader>c", ":'<,'>TZNarrow<CR>"},
	},

	-- Visual mode.
	x = {},

	-- All modes.
	[""] = {},
}

for mode, mode_map in pairs(keys) do
	for _, map in pairs(mode_map) do
		local default_opts = {noremap=true, silent=true}

		-- The unpack function has been replaced by table.unpack in Lua 5.2.
		-- Make sure to fix this once Neovim upgrades Lua.
		local prefix, cmd = unpack(map)
		vim.api.nvim_set_keymap(mode, prefix, cmd, default_opts)
	end
end
