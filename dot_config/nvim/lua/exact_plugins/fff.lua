return {
	"dmtrKovalenko/fff",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	lazy = false,
	keys = {
		{
			"<leader>fc",
			function()
				require("fff").find_files_in_dir(vim.fn.stdpath("config"))
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fr",
			function()
				require("fff").find_files()
			end,
			desc = "Recent Files",
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
	opts = {},
}
