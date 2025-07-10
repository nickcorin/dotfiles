return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	opts = {
		auto_install = true,
		ensure_installed = "all",
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		ignore_install = { "ipkg" },
	},
}
