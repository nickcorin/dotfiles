" Auto-organize imports on save.
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
