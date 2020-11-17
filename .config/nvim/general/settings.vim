set shell=/bin/zsh
set t_Co=256
set tabstop=4
set shiftwidth=4
set nocompatible				" Remove some limitations. Mostly a no-op.
filetype off					" Disable native filetype checking.
filetype plugin indent on		" Enable plugin and indentation filetype checking.  
set noshowmode					" Don't show the mode, since we're using lightline for that.
set ttyfast					    " Faster, smoother scrolling.
set laststatus=2				" Always show status bar.
set encoding=utf-8
set autoread					" Re-read changed files automatically. 
set autowrite					" Save files automatically.
set autoindent
set backspace=indent,eol,start	" Empower backspace.
set incsearch					" Match searches while typing.
set hlsearch					" Highlight search matches.
set mouse=a					    " Enable mouse mode.
set novisualbell				" Disable the visual bell.
set noerrorbells				" Disable bells.
set number relativenumber		" Enable line numbers - relative.
set showcmd					    " Show commands being typed.
set noswapfile					" Don't create swap files.
set nobackup					" Don't create backup files.
set splitright					" Vertical splits to the right.                
set splitbelow					" Horizontal splits to the bottom.
set ignorecase					" Case insensitive searching.
set smartcase					" ...unless it starts with a capital.
set hidden
set cursorline

" Auto-wrap comments when we hit 80 lines.
set textwidth=80

" Show visual margin at 80 characters.
set cc=80
