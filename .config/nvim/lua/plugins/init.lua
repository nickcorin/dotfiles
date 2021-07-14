return require("packer").startup(function()
	-- Packer can manage itself.
	use "wbthomason/packer.nvim"

	use "neovim/nvim-lspconfig"

	-- General {
	use "tpope/vim-sensible"
	-- }

	-- Colorschemes {
	use "arcticicestudio/nord-vim"
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
	--
end)

