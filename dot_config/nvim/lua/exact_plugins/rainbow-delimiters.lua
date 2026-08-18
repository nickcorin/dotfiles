return {
	"HiPhish/rainbow-delimiters.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function(_, opts)
		require("rainbow-delimiters.setup").setup(opts)
	end,
	opts = {},
}
