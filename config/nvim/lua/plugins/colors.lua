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

		"kvrohit/rasmus.nvim",
		name = "rasmus",
		lazy = false,
		config = function()
			vim.g.rasmus_transparent = false
			vim.g.rasmus_variant = "dark" -- or "monochrome".
		end,
	},
	{

		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		lazy = false,
		config = function()
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_dim_inactive_windows = 1
			vim.g.gruvbox_material_transparent_background = 2
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_ui_contrast = "dim"
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_statusline_style = "material"
			vim.g.gruvbox_material_cursor = "auto"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_visual = "reverse"
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
