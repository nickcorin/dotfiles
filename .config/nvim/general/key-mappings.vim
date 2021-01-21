" This must be set first for  other mappings with <leader> to be set
" correctly.
let mapleader = ','

" Easy quick fixing.
nnoremap <leader>a :cclose<CR>

" Fast save.
nnoremap <leader>w :w!<CR>

" Fast quit.
nnoremap <leader>q :q!<CR>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Clear search highlight.
nnoremap <leader><space> :nohlsearch<CR>

" Shift-J and Shift-K to visually move lines up and down.
" gv=gv to stay in visual mode after the move.
vnoremap <S-j> :m'>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Shift-/ when visually selected comments out a line.
nnoremap ? :Commentary<CR>
vnoremap ? :Commentary<CR>

" After indending a visually selected line, keep the selection.
vnoremap > >gv
vnoremap < <gv

" Duplicate lines down.
nnoremap <leader>d yyp
vnoremap <leader>d yyp

" Better split switching, using the default directional keys.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Jump to start and end of line using the home row keys
map H ^
map L $

" No arrow keys - force yourself to use the keyboard. 
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Move by line
nnoremap j gj
nnoremap k gk
