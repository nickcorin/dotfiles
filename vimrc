"=====================================================
"===================== Vim Plug ======================

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-rooter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chriskempson/base16-vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'dense-analysis/ale'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'fatih/molokai'					
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}					
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'			
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'roxma/vim-tmux-clipboard'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'	
Plug 'vim-syntastic/syntastic'

call plug#end()

"=====================================================
"===================== SETTINGS ======================

if !has('gui_running')
	set t_Co=256
end

syntax enable					" Enable syntax highlighting.
colorscheme base16-gruvbox-dark-medium		" Set the colorscheme.
"set t_Co=256					" Use 256-bit colors.
set background=dark				" Enable dark mode.
let g:molokai_original = 1
let g:rehash256 = 1

set nocompatible				" Remove some limitations. Mostly a no-op.
filetype off					" Disable native filetype checking.
filetype plugin indent on			" Enable plugin and indentation filetype checking.

set noshowmode					" Don't show the mode, since we're using lightline for that.
set colorcolumn=80				" Adding a visual indicator at 80 characters.
set ttyfast					" Faster, smoother scrolling.
set laststatus=2				" Always show status bar.
set encoding=utf-8
set autoread					" Re-read changed files automatically. 
set autowrite					" Save files automatically.
set autoindent
set backspace=indent,eol,start			" Empower backspace.
set incsearch					" Match searches while typing.
set hlsearch					" Highlight search matches.
set mouse=a					" Enable mouse mode.
set novisualbell				" Disable the visual bell.
set noerrorbells				" Disable bells.
set number					" Enable line numbers.
set relativenumber				" Enable line numbers - relative.
set showcmd					" Show commands being typed.
set noswapfile					" Don't create swap files.
set nobackup					" Don't create backup files.
set splitright					" Vertical splits to the right.
set splitbelow					" Horizontal splits to the bottom.
set ignorecase					" Case insensitive searching.
set smartcase					" ...unless it starts with a capital.
set hidden

"=====================================================
"===================== Mappings  =====================

" This must be set first for  other mappings with <leader> to be set
" correctly.
let mapleader = ','

" Easy quick fixing.
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" Fast save.
nnoremap <leader>w :w!<CR>

" Fast quit.
nnoremap <leader>q :q!<CR>

" Clear search highlight.
nnoremap <leader><space> :nohlsearch<CR>

" Better split switching, using the default directional keys.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Shift-J and Shift-K to visually move lines up and down.
" gv=gv to stay in visual mode after the move.
vnoremap <S-j> :m'>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv


"=====================================================
"===================== Misc Filetypes ================

augroup html_bindings
	autocmd! html_bindings

	autocmd BufNewFile,BufRead *html setlocal expandtab
	autocmd BufNewFile,BufRead *html setlocal shiftwidth=2 
	autocmd BufNewFile,BufRead *html setlocal tabstop=2
augroup end

"=====================================================
"===================== Go ============================

let g:go_fmt_command='goimports'
let g:go_autodetect_gopath = 1
let g:go_def_mapping_enabled = 0

augroup go_bindings
	autocmd! go_bindings

	autocmd BufNewFile,BufRead *.go nnoremap <buffer> <C-d> :GoDoc<CR>
	autocmd BufNewFile,BufRead *.go nmap <buffer> <C-d> <esc>:GoDoc<CR>

	autocmd BufNewFile,BufRead *.go nnoremap <buffer> <C-o> :GoDef<CR>
	autocmd BufNewFile,BufRead *.go nnoremap <buffer> <C-i> :GoDefPop<CR>

	autocmd BufNewFile,BufRead *.go inoremap <buffer> <leader>f :GoFmt<CR>
	autocmd BufNewFile,BufRead *.go nnoremap <buffer> <leader>v :GoVet<CR>

	autocmd BufNewFile,BufRead *.go nnoremap <buffer> <leader>] :GoDef<CR>
	autocmd BufNewFile,BufRead *.go nnoremap <buffer> <leader>[ :GoDefPop<CR>

	autocmd BufNewFile,BufRead *.go nnoremap <buffer> <leader>t :GoAlternate<CR>

augroup end

"=====================================================
"===================== Rust = ========================

let g:rustfmt_autosave = 1

augroup rust_bindings
	autocmd! rust_bindings

	autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>f :RustFmt<CR>
augroup end

"=====================================================
"===================== Fzf ===========================
"
let g:fzf_command_prefix = 'Fzf'

" Ctrl-T to open, Ctrl-Shift-T to open in fullscreen.
nnoremap <silent> <C-t> :FzfFiles<CR>

" Ctrl-P to search history.
nnoremap <silent> <C-p> :FzfHistory<CR>
"nnoremap <silent> <C-S-O> :FzfFiles!<CR>

" Jump to existing window, if available.
let g:fzf_buffers_jump = 1

let g:fzf_layout = { 'down': '~40%' }

"=====================================================
"===================== Lightline =====================



"=====================================================
"===================== NerdTree ====================== 

map <leader>. :NERDTreeToggle<CR>

"=====================================================
"===================== Ack / Ag ======================

let g:ackprg = 'ag --vimgrep --smart-case'
