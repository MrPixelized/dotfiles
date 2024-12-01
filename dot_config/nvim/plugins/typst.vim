let g:typst_pdf_viewer = 'zathura'

augroup typst
	autocmd FileType typst, nnoremap <leader>ll :TypstWatch<CR>	
augroup END

