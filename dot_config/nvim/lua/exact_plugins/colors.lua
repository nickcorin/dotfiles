local active_theme = require("config.theme").name

return {
	{
		"wincent/base16-nvim",
		name = "base16-nvim",
		lazy = active_theme ~= "classic-dark",
		priority = 1000,
		config = active_theme == "classic-dark" and function()
			vim.cmd.colorscheme("classic-dark")
		end or nil,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = active_theme ~= "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
		},
		config = active_theme == "catppuccin" and function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end or nil,
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = active_theme ~= "cyberdream",
		priority = 1000,
		opts = {
			borderless_pickers = false,
			cache = false,
			hide_fillchars = false,
			italic_comments = false,
			saturation = 1,
			terminal_colors = true,
			transparent = false,
			variant = "default",
			extensions = {
				gitsigns = true,
				lazy = true,
				treesitter = true,
			},
		},
		config = active_theme == "cyberdream" and function(_, opts)
			require("cyberdream").setup(opts)
			vim.cmd.colorscheme("cyberdream")
		end or nil,
	},
	{
		"sainnhe/everforest",
		name = "everforest",
		lazy = active_theme ~= "everforest",
		priority = 1000,
		init = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = 0
			vim.g.everforest_transparent_background = 1
		end,
		config = active_theme == "everforest" and function()
			vim.cmd.colorscheme("everforest")
		end or nil,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		lazy = active_theme ~= "gruvbox",
		priority = 1000,
		opts = {
			bold = true,
			contrast = "",
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
			transparent_mode = true,
			undercurl = true,
			underline = true,
		},
		config = active_theme == "gruvbox" and function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd.colorscheme("gruvbox")
		end or nil,
	},
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		lazy = active_theme ~= "gruvbox-material",
		priority = 1000,
		init = function()
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
		end,
		config = active_theme == "gruvbox-material" and function()
			vim.cmd.colorscheme("gruvbox-material")
		end or nil,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = active_theme ~= "kanagawa",
		priority = 1000,
		opts = {
			theme = "dragon",
			background = {
				dark = "dragon",
			},
		},
		config = active_theme == "kanagawa" and function(_, opts)
			require("kanagawa").setup(opts)
			vim.cmd.colorscheme("kanagawa")
		end or nil,
	},
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		lazy = active_theme ~= "nord",
		priority = 1000,
		init = function()
			vim.g.nord_bold = true
			vim.g.nord_borders = true
			vim.g.nord_contrast = true
			vim.g.nord_cursorline_transparent = false
			vim.g.nord_disable_background = false
			vim.g.nord_enable_sidebar_background = true
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_backgrounds = false
		end,
		config = function()
			require("nord").set()
			if active_theme == "nord" then
				vim.cmd.colorscheme("nord")
			end
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = active_theme ~= "rose-pine",
		priority = 1000,
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
		config = active_theme == "rose-pine" and function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
		end or nil,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = active_theme ~= "tokyonight",
		priority = 1000,
		opts = {
			style = "night",
		},
		config = active_theme == "tokyonight" and function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end or nil,
	},
	{
		"datsfilipe/vesper.nvim",
		name = "vesper",
		lazy = active_theme ~= "vesper",
		priority = 1000,
		opts = {
			transparent = false,
			italics = {
				comments = false,
				keywords = false,
				functions = false,
				strings = false,
				variables = false,
			},
		},
		config = active_theme == "vesper" and function(_, opts)
			require("vesper").setup(opts)
			vim.cmd.colorscheme("vesper")
		end or nil,
	},
}
