" ===== SETTINGS ===== "
" Enable modelines
" set modelines

" Make sure to set the terminal title
set title

" Set the leader key to space
let mapleader = " "
let maplocalleader = " "

" Make neovim work with virtual environments
let g:python3_host_prog = '/usr/bin/python'

" Maximize mouse functionality
set mouse=a

" Disable netrw
let g:loaded = 1
let g:loaded_netrwPlugin = 1

" Enable file type detection.
filetype plugin indent on

" No line numbers for terminals
autocmd TermOpen * setlocal nonumber norelativenumber

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

nnoremap to :NvimTreeToggle<CR>

" Keep an undo file (undo changes after closing)
if has("persistent_undo")
  set undofile
endif

" Switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

set history=200		" Keep 200 lines of command line history
set ruler			" Show the cursor position all the time
set showcmd			" Display incomplete commands
set wildmenu		" Display completion matches in a status line

set ttimeout		" Time out for key codes
set ttimeoutlen=100	" Wait up to 100ms after Esc for special key

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Case-insensitive search
set ignorecase
set smartcase

" Enable hybrid line numbering
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Show a few lines of context around the cursor.
set scrolloff=5

" Change tab width
set tabstop=4
set shiftwidth=4

" Hide dropdown windows after completion (syntastic etc.)
"autocmd CompleteDone * pclose

" Settings for the file explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 16

" Case-insensitive autocomplete for files
set wildignorecase

" Set syntax marking for ejs files to html
augroup ejs
  autocmd BufNewFile,BufRead *.ejs set syntax=html
augroup END

" Enable spell check and word wrap in latex documents
autocmd FileType tex, set spell
autocmd FileType tex, set textwidth=79

" Enable spell check and word wrap in typst documents
autocmd FileType typst, set spell
autocmd FileType typst, set textwidth=79

" Universal status line
set laststatus=3

" Fix gx
nnoremap <silent> gx :execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>

" ===== HOTKEYS ===== "
" Leader+r to run the file
" Leader+o to open the current file using xdg-open
" Leader+ll to compile various markup documents
" Leader+lv to view various markup documents
" Leader+h to toggle highlighting
" Ctrl+h to halve the line at cursor (opposite of J)
nnoremap <leader>r :!%:p<CR>
nnoremap <leader>o :silent !xdg-open %<CR>
nnoremap <leader>h :set hls!<CR>
nnoremap <C-h> i<CR><Esc>

" Compile and preview commands for graphviz
augroup graphviz
  autocmd FileType dot, nnoremap <leader>ll :w<CR>:!dot -Tpdf % -o %:r.pdf<CR>
  autocmd FileType dot, nnoremap <leader>lv :silent !xdg-open %:r.pdf&<CR><C-l>
augroup END

" Compile and preview commands for gnuplot
augroup gnuplot
  autocmd FileType gnuplot, nnoremap <leader>ll :w<CR>:silent !gnuplot %<CR>
  autocmd FileType gnuplot, nnoremap <leader>lv :silent !xdg-open %:r.png&<CR><C-l>
augroup END

" Compile and preview commands for d2
augroup d2
	autocmd FileType d2, nnoremap <leader>ll :w<CR>:silent !d2 % %:r.svg<CR>
	autocmd FileType d2, nnoremap <leader>lv :silent !xdg-open %r.svg&<CR><C-l>
augroup END

" Compile and preview commands for markdown
augroup markdown
  autocmd FileType markdown, nnoremap <leader>ll :w<CR>:silent !pandoc % --from=gfm -t pdf -o %:r.pdf<CR><C-l>
  autocmd FileType markdown, nnoremap <leader>lv :silent !xdg-open '%:r.pdf'&<CR><C-l>
augroup END

augroup markdown_presentations
  autocmd FileType markdown.presentation, nnoremap <leader>ll :w<CR>:silent !pandoc % --from=gfm -t beamer -o %:r.pdf<CR><C-l>
  autocmd FileType markdown.presentation, nnoremap <leader>lv :silent !xdg-open '%:r.pdf'&<CR><C-l>
augroup END

" Preview command for HTML
augroup html
	autocmd FileType html, nnoremap <leader>lv :silent !xdg-open %<CR>	
augroup END

" ===== APPEARANCE ===== "
" Enable syntax highlighting
syntax on

" Set colors
source ~/.config/nvim/colors.vim

" Change cursor shape for modes
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Column highlighting
highlight ColorColumn guibg=#FC1A70
call matchadd('ColorColumn', '\%81v\S', 100)

" ===== PLUGINS ===== "
source ~/.config/nvim/plugins.vim
