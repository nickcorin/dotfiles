" Plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'arcticicestudio/nord-vim'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}					
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'	

call plug#end()

" General settings
" -----------------------------------------------------------------------------
if !has('gui_running')
	set t_Co=256
end

set tabstop=4
set shiftwidth=4

set nocompatible				" Remove some limitations. Mostly a no-op.
filetype off					" Disable native filetype checking.
filetype plugin indent on		" Enable plugin and indentation filetype checking.
set noshowmode					" Don't show the mode, since we're using lightline for that.
set colorcolumn=80				" Adding a visual indicator at 80 characters.
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
set number					    " Enable line numbers.
set relativenumber				" Enable line numbers - relative.
set showcmd					    " Show commands being typed.
set noswapfile					" Don't create swap files.
set nobackup					" Don't create backup files.
set splitright					" Vertical splits to the right.
set splitbelow					" Horizontal splits to the bottom.
set ignorecase					" Case insensitive searching.
set smartcase					" ...unless it starts with a capital.
set hidden

" Color Scheme
" -----------------------------------------------------------------------------
" let g:gruvbox_contrast_dark='dark'
colorscheme nord
syntax enable

" Support transparent terminals.
hi Normal ctermbg=none
hi NonText ctermbg=none

" Key mappings
" -----------------------------------------------------------------------------
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

" Misc Filetypes
" -----------------------------------------------------------------------------
augroup html_bindings
	autocmd! html_bindings

	autocmd BufNewFile,BufRead *.html setlocal expandtab
	autocmd BufNewFile,BufRead *.html setlocal shiftwidth=2 
	autocmd BufNewFile,BufRead *.html setlocal tabstop=2
augroup end

augroup json_bindings
	autocmd! json_bindings

	autocmd BufNewFile,BufRead *.json setlocal expandtab
	autocmd BufNewFile,BufRead *.json setlocal shiftwidth=2 
	autocmd BufNewFile,BufRead *.json setlocal tabstop=2
augroup end

augroup yaml_bindings
	autocmd! yaml_bindings

	autocmd BufNewFile,BufRead *.yaml,*.yml setlocal expandtab
	autocmd BufNewFile,BufRead *.yaml,*.yml setlocal shiftwidth=2 
	autocmd BufNewFile,BufRead *.yaml,*.yml setlocal tabstop=2
augroup end
" Go
" -----------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command='goimports'

let g:go_def_mapping_enabled = 0
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_info_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_complete_unimported = 1
let g:go_implements_mode = 'gopls'
let g:go_diagnostics_enabled = 1
let g:go_doc_popup_window = 1

augroup go_bindings
	autocmd! go_bindings
	autocmd BufNewFile,BufRead *.go noremap <buffer> <C-]> :GoDef<CR>
	autocmd BufNewFile,BufRead *.go noremap <buffer> <C-i> :GoDefPop<CR> 
	autocmd BufNewFile,BufRead *.go noremap <buffer> <C-t> :GoTest<CR> 
	autocmd BufNewFile,BufRead *.go noremap <buffer> <Leader>f :GoMetalinter<CR> 
	autocmd BufNewFile,BufRead *.go noremap <buffer> <Leader>t :GoAlternate<CR>
	autocmd BufNewFile,BufRead *.go noremap <buffer> <Leader>r :GoReferrers<CR> 
	autocmd BufNewFile,BufRead *.go noremap <buffer> <Leader>d :GoDecls<CR>
	autocmd BufNewFile,BufRead *.go noremap <buffer> <Leader>D :GoDeclsDir<CR> 
augroup end

" Rust
" -----------------------------------------------------------------------------
let g:rustfmt_autosave = 1

augroup rust_bindings
	autocmd! rust_bindings
	autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <Leader>f :RustFmt<CR>
augroup end

" Fzf
" -----------------------------------------------------------------------------
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_command_prefix = 'Fzf'

" Ctrl-O to open, Ctrl-Shift-O to open in fullscreen.
noremap <silent> <C-o> :FzfFiles<CR>

" Ctrl-H to search history.
noremap <silent> <C-h> :FzfHistory<CR>

" Jump to existing window, if available.
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }

" Lightline
" -----------------------------------------------------------------------------
let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'component_function': {
	\	'filename': 'RelativePath'
	\ }
	\ }

" Returns the absolute path of the current file to display in the status bar.
function! AbsolutePath()
  return expand('%:p:h')
endfunction

" Returns the relative path of the current file to display in the status bar.
function! RelativePath()
	return expand("%")
endfunction
