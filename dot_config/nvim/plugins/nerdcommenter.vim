" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Don't default mappings
let g:NERDCreateDefaultMappings = 0

" Mappings
nnoremap <silent> <leader>c :call nerdcommenter#Comment('n', 'toggle')<CR>
vnoremap <silent> <leader>c :call nerdcommenter#Comment('x', 'toggle')<CR>

nnoremap <silent> <leader>C :call nerdcommenter#Comment('n', 'comment')<CR>
vnoremap <silent> <leader>C :call nerdcommenter#Comment('x', 'comment')<CR>

nnoremap <silent> <leader>yc :call nerdcommenter#Comment('n, 'yank')<CR>
vnoremap <silent> <leader>yc :call nerdcommenter#Comment('x, 'yank')<CR>
