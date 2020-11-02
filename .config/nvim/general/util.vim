" Returns the absolute path of the current file.
function! AbsolutePath()
  return expand('%:p:h')
endfunction

" Returns the relative path of the current file.
function! RelativePath()
	return expand("%")
endfunction
