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
		"scottmckendry/cyberdream.nvim",
		enabled = false,
		name = "cyberdream",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("cyberdream").setup(opts)
			vim.cmd("colorscheme cyberdream")
		end,
		opts = {
			borderless_pickers = false,
			cache = false,
			hide_fillchars = false,
			italic_comments = false,
			saturation = 1,
			terminal_colors = true,
			transparent = false,
			variant = "auto",
			extensions = {
				alpha = true,
				blinkcmp = true,
				gitsigns = true,
				lazy = true,
				noice = true,
				treesitter = true,
				trouble = true,
			},
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		name = "gruvbox",
		priority = 1000,
		lazy = false,
		opts = {
			bold = true,
			contrast = "hard",
			dim_inactive = false,
			inverse = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			terminal_colors = true,
			transparent_mode = false,
			undercurl = true,
			underline = true,
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = false,
		name = "gruvbox-material",
		priority = 1000,
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
		"shaunsingh/nord.nvim",
		enabled = false,
		name = "nord",
		config = function(_, opts)
			vim.g.nord_bold = true
			vim.g.nord_borders = true
			vim.g.nord_contrast = true
			vim.g.nord_cursorline_transparent = false
			vim.g.nord_disable_background = false
			vim.g.nord_enable_sidebar_background = true
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_backgrounds = false

			require("nord").set()
			vim.cmd.colorscheme("nord")
		end,
		opts = {
			borders = true,
			transparent = false,
		},
	},
	{
		"datsfilipe/vesper.nvim",
		enabled = false,
		name = "vesper",
		priority = 1000,
		lazy = false,
		config = function(_, opts)
			require("vesper").setup(opts)
			vim.cmd("colorscheme vesper")
		end,
		opts = {
			transparent = true,
			italics = {
				comments = false,
				keywords = false,
				functions = false,
				strings = false,
				variables = false,
			},
		},
	},
	{
		"rose-pine/neovim",
		enabled = true,
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
