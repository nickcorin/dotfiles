return {
	{
		"nvim-mini/mini.diff",
		keys = {
			{
				"<leader>go",
				function()
					require("mini.diff").toggle_overlay(0)
				end,
				desc = "Toggle mini.diff overlay",
			},
		},
		opts = {},
		version = false,
	},
	{
		"nvim-mini/mini.extra",
		opts = {},
		version = false,
	},
	{
		"nvim-mini/mini.files",
		dependencies = {
			"nvim-mini/mini.icons",
		},
		keys = {
			{
				"<leader>e",
				function()
					MiniFiles.open()
				end,
				desc = "Find Files",
			},
		},
		opts = {
			options = {
				permanent_delete = false,
				use_as_default_explorer = true,
			},
		},
		version = false,
	},
	{
		"nvim-mini/mini.pick",
		dependencies = {
			"nvim-mini/mini.icons",
		},
		keys = {
			{
				"<leader>ff",
				function()
					MiniPick.builtin.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					MiniPick.builtin.files({ tool = "git" })
				end,
				desc = "Find Files",
			},
		},
		lazy = false,
		opts = {
			mappings = {
				move_down = "<C-j>",
				move_up = "<C-k>",
				scroll_down = "<C-d>",
				scroll_up = "<C-u>",
			},
		},
		version = false,
	},
	{
		"nvim-mini/mini.surround",
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes.
				delete = "gsd", -- Delete surrounding.
				find = "gsf", -- Find surrounding (to the right).
				find_left = "gsF", -- Find surrounding (to the left).
				highlight = "gsh", -- Highlight surrounding.
				replace = "gsr", -- Replace surrounding.
				update_n_lines = "gsn", -- Update `n_lines`.
			},
		},
	},
}
