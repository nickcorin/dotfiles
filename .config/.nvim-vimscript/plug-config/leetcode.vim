" Which browser to store the session cookie in.
let g:leetcode_browser = 'chrome'

" I am not in China.
let g:leetcode_china = 0

" Show companies list.
let g:leetcode_hide_companies = 0

" Show paid only questions.
let g:leetode_hide_paid_only = 0

" Show topics list.
let g:leetcode_hide_topics = 0

" Show all problems.
let g:leetcode_problemset = 'all'

" Answer questions in C++.
let g:leetcode_solution_filetype = 'cpp'

nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
