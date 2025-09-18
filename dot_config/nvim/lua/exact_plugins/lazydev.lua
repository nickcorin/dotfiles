return {
	"folke/lazydev.nvim",
	ft = "lua",
	cmd = "LazyDev",
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "lazy.nvim", words = { "LazyVim" } },
			{ path = "mini.diff", words = { "MiniDiff" } },
			{ path = "mini.files", words = { "MiniFiles" } },
			{ path = "mini.pick", words = { "MiniPick" } },
			{ path = "snacks.nvim", words = { "Snacks" } },
		},
	},
}
