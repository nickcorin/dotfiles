return require("packer").startup(function()
	-- Packer can manage itself.
	use "wbthomason/packer.nvim"

	-- LSP {
	use "neovim/nvim-lspconfig"
	-- }

	-- UI {
	use "karb94/neoscroll.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use "Pocco81/true-zen.nvim"
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- }

	-- General {
	use "airblade/vim-gitgutter"
	use "airblade/vim-rooter"
	use "andymass/vim-matchup"
	use "machakann/vim-highlightedyank"
	use "tpope/vim-sensible"
	-- }

	-- Colorschemes {
	use "arcticicestudio/nord-vim"
	use "chriskempson/base16-vim"
	use "cocopon/iceberg.vim"
	use "dracula/vim"
	use "luisiacc/gruvbox-baby"
	use "morhetz/gruvbox"
	use "sainnhe/gruvbox-material"
	use "sam4llis/nvim-tundra"
	-- }
	
	-- Github integration {
	use {
    	"ldelossa/gh.nvim",
    	requires = {{ 'ldelossa/litee.nvim' }}
  	}
	-- }
	
	-- Autocomplete {
	use "hrsh7th/nvim-compe"
	-- }
	
	-- Fuzzy finding {
	use {
		"nvim-telescope/telescope.nvim",
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	-- }
	
	-- Language support {
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	use "dag/vim-fish"
	-- }
end)

