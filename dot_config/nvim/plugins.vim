let s:rsourcefiles = []

function! Rsource(rpath)
  let path = '~/.config/nvim/plugins/' . a:rpath . '.vim'
  call insert(s:rsourcefiles, path)
endfunction

call Rsource ("steno")
call Rsource ("quickfix")

call plug#begin()
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoplete-lsp'

" Nvim-cmp completion plugin and sources
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-calc', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
Plug 'quangnguyen30192/cmp-nvim-ultisnips', { 'branch': 'main' }
Plug 'petertriho/cmp-git', { 'branch': 'main' }
Plug 'kdheepak/cmp-latex-symbols', { 'branch': 'main' }
call Rsource ("nvim-cmp")

"" Coq completion
"Plug 'ms-jpq/coq_nvim', { 'branch': 'coq', 'do': ':QOCdeps' }
"Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }
"Plug 'ms-jpq/coq.thirdparty', { 'branch': '3p' }
"source 'coq.vim'

" Nerdcommenter
Plug 'preservim/nerdcommenter'
call Rsource ("nerdcommenter")

Plug 'neovim/nvim-lspconfig'
call Rsource ("lsp")

" Plug 'Shougo/echodoc.vim'
" call Rsource ("echodoc")

Plug 'SirVer/ultisnips'
call Rsource ("ultisnips")

Plug 'elkowar/yuck.vim'

"Plug 'neomake/neomake'
"call Rsource ("neomake")

"Plug 'itchyny/lightline.vim'
"call Rsource ("lightline")

Plug 'nvim-lualine/lualine.nvim'
call Rsource ("lualine")

Plug 'lervag/vimtex'
call Rsource ("vimtex")

Plug 'kaarmu/typst.vim', { 'branch': 'main' }
call Rsource ("typst")

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

"Plug 'sheerun/vim-polyglot'
"Plug 'Chiel92/vim-autoformat'
Plug 'nvim-lua/plenary.nvim'

Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' }
call Rsource ("gitsigns")

Plug 'junegunn/fzf.vim'
call Rsource ("fzf")

"Plug 'goerz/jupytext.vim'

Plug 'rhysd/vim-clang-format'
call Rsource ("clang-format")

Plug 'RRethy/nvim-base16'

Plug 'dccsillag/magma-nvim', { 'branch': 'main', 'do': ':UpdateRemotePlugins' }
call Rsource ("magma")

Plug 'kyazdani42/nvim-tree.lua' ", { 'on': ['NvimTreeOpen', 'NvimTreeToggle'] }
"autocmd! User nvim-tree.lua
call Rsource ("nvim-tree")

" Icon support for a buncha stuff
Plug 'kyazdani42/nvim-web-devicons'

"Plug 'norcalli/nvim-colorizer.lua'
"call Rsource ("nvim-colorizer")

Plug 'rubixninja314/vim-mcfunction'

" Plug 'romgrk/barbar.nvim'
" call Rsource ("barbar")

Plug 'terrastruct/d2-vim'
call Rsource ("d2-vim")

Plug 'folke/todo-comments.nvim'
call Rsource ("todo-comments")

Plug 'ledger/vim-ledger'
call Rsource ("vim-ledger")

Plug 'b0o/incline.nvim'
call Rsource ("incline")

call plug#end()

for path in s:rsourcefiles
	exec 'source ' . path
endfor
