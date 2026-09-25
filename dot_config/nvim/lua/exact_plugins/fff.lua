return {
	"dmtrKovalenko/fff",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	lazy = false,
	keys = {
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>sg",
			function()
				require("fff").live_grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				require("fff").live_grep_under_cursor()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
	},
	opts = {
		layout = {
			height = 0.6,
			prompt_position = "top",
		},
		preview = {
			enabled = false,
		},
	},
}
