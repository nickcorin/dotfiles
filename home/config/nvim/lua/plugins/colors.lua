return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = {
			flavour = "mocha",
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		lazy = false,
		opts = {
			contrast = "hard",
		},
	},
	{

		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		lazy = false,
		config = function()
			vim.g["gruvbox_material_disable_italic_comment"] = 1
			vim.g["gruvbox_material_enable_bold"] = 1
			vim.g["gruvbox_material_enable_italic"] = 0
			vim.g["gruvbox_material_foreground"] = "material"
			vim.g["gruvbox_material_background"] = "hard"
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		opts = {
			theme = "dragon",
			background = {
				dark = "dragon",
			},
		},
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		opts = {},
	},
	{

		"shaunsingh/nord.nvim",
		name = "nord",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = true,
			disable_background = false,
			extend_background_behind_borders = true,
			styles = {
				bold = true,
				italic = false,
				transparency = false,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		opts = {
			style = "night",
		},
	},
}
