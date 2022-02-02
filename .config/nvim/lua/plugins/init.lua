return require("packer").startup(function()
	-- Packer can manage itself.
	use "wbthomason/packer.nvim"

	use "neovim/nvim-lspconfig"

	-- General {
	use "airblade/vim-rooter"
	use "andymass/vim-matchup"
	use "machakann/vim-highlightedyank"
	use "tpope/vim-sensible"
	-- }

	-- Colorschemes {
	use "arcticicestudio/nord-vim"
	use "chriskempson/base16-vim"
	use "dracula/vim"
	use "morhetz/gruvbox"
	-- }
	
	-- Autocomplete {
	use "hrsh7th/nvim-compe"
	-- }
	
	-- Fuzzy finding {
	use {
		'nvim-telescope/telescope.nvim',
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

