noremap <silent> <leader>b :FzfBuffers<CR>
noremap <silent> <leader>c :FzfCommits<CR>
noremap <silent> <leader>f :FzfRg<CR>
noremap <silent> <leader>g :FzfGFiles<CR>
noremap <silent> <leader>h :FzfHistory<CR>
noremap <silent> <leader>z :FzfFiles<CR>

" Calls to Fzf should be prefixed with 'Fzf' to ensure there are no clashes
" with other plugins.
let g:fzf_command_prefix = 'Fzf'

" Jump to existing window, if available.
let g:fzf_buffers_jump = 1

" Search from the top.
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

" Explicitly set keys to open files in splits.
" These are the defaults.
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

" Set colors to match the colorscheme.
let g:fzf_colors = {
			\ 'fg':      ['fg', 'Normal'],
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

" Set the layout of the window.
let g:fzf_layout = {
			\ 'up':'~90%',
			\ 'window': {
			\ 'width': 0.8,
			\ 'height': 0.3,
			\ 'yoffset':0.5,
			\ 'xoffset': 0.5,
			\ 'highlight': 'Todo',
			\ 'border': 'sharp' } }

