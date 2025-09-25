return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	lazy = false,
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		ignore_install = { "ipkg" },
	},
	version = false,
}
