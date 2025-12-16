return {
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		lazy = false,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd("colorscheme catppuccin")
		end,
		opts = {
			flavour = "mocha",
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		name = "gruvbox",
		lazy = false,
		opts = {
			contrast = "hard",
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = true,
		name = "gruvbox-material",
		lazy = false,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_cursor = "auto"
			vim.g.gruvbox_material_dim_inactive_windows = 1
			vim.g.gruvbox_material_disable_italic_comment = 0
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_ui_contrast = "low"
			-- vim.g.gruvbox_material_visual = "reverse"
			vim.cmd("colorscheme gruvbox-material")
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
		"gbprod/nord.nvim",
		enabled = false,
		name = "nord",
		config = function(_, opts)
			require("nord").setup(opts)
			vim.cmd.colorscheme("nord")
		end,
		opts = {
			borders = true,
			transparent = false,
		},
	},
	{
		"rose-pine/neovim",
		enabled = false,
		name = "rose-pine",
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd("colorscheme rose-pine")
		end,
		opts = {
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = true,
			disable_background = false,
			extend_background_behind_borders = true,
			styles = {
				bold = true,
				italic = false,
				transparency = true,
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
