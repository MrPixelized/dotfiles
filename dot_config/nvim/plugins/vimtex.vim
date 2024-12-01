autocmd Filetype tex set modelineexpr
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0
let g:tex_conceal='abdmg'

let g:vimtex_compiler_latexmk = {
 	\ 'build_dir' : '',
 	\ 'callback' : 1,
 	\ 'continuous' : 1,
 	\ 'executable' : 'latexmk',
 	\ 'hooks' : [],
 	\ 'options' : [
 	\   '-verbose',
 	\   '-file-line-error',
 	\   '-synctex=1',
 	\   '-interaction=nonstopmode',
 	\   '--shell-escape',
 	\ ],
 	\}

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-lualatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}


let g:vimtex_compiler_engine = 'lualatex'

set conceallevel=1
hi Conceal ctermbg=none
