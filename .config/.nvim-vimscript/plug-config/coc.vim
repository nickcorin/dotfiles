nmap <silent> gd  			<Plug>(coc-definition)
xmap <silent> <leader>f   	<Plug>(coc-format-selected)
nmap <silent> <leader>f   	<Plug>(coc-format-selected)
nmap <silent> gi  			<Plug>(coc-implementation)
nmap <silent> gr  			<Plug>(coc-references)
nmap <silent> <leader>rn 	<Plug>(coc-rename)
nmap <silent> gy  			<Plug>(coc-type-definition)
nmap <silent> <C-n> 		<Plug>(coc-diagnostic-next)
nmap <silent> <C-p> 		<Plug>(coc-diagnostic-prev)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" This is noise as heck: see https://github.com/neoclide/coc.nvim/issues/888
autocmd BufWritePre *.go :OR
