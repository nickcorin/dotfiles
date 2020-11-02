" Install vim-plug and plugins if they're not present.
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
	" Nord color scheme.
	Plug 'arcticicestudio/nord-vim'

	" Answer leetcode questions in VIM.
	Plug 'ianding1/leetcode.vim'

	" Fuzzy finder.
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Gruvbox color scheme.
	Plug 'morhetz/gruvbox'

	" Polyglot intellisense and code navigation.
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Preview hex colors in vim.
	Plug 'norcalli/nvim-colorizer.lua'

	" Auto close parenthesis, quotes, etc.
	Plug 'Raimondi/delimitMate'

	" Easy commenting of lines.
	Plug 'tpope/vim-commentary'

	" Git integration 
	Plug 'tpope/vim-fugitive'	
call plug#end()
