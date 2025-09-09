return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("chezmoi").setup({
			on_apply = {
				notification = {
					enable = true,
					msg = "👀 ✅",
					opts = {},
				},
			},
		})
	end,
}
