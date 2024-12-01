lua << EOF
local capabilities = require("cmp_nvim_lsp").default_capabilities()
	--capabilities = require('coq').lsp_ensure_capabilities({})['capabilities']

	require('lspconfig').rust_analyzer.setup({capabilities=capabilities})
	require('lspconfig').jedi_language_server.setup({capabilities=capabilities})
	--require('lspconfig').ruff_lsp.setup({capabilities=capabilities})
	--require('lspconfig').pylyzer.setup({capabilities=capabilities})
	require('lspconfig').denols.setup({capabilities=capabilities})
	require('lspconfig').clangd.setup({capabilities=capabilities})
	require('lspconfig').texlab.setup({capabilities=capabilities})
	require('lspconfig').vimls.setup({capabilities=capabilities})
	require('lspconfig').hls.setup({capabilities=capabilities})
	require('lspconfig').spyglassmc_language_server.setup({capabilities=capabilities})
	require('lspconfig').tinymist.setup({capabilities=capabilities,
		settings={
			exportPdf = "onType"
		}
	})
EOF

" Set keybinding to show hover info
augroup UserLspConfig
    " -- Enable completion triggered by <c-x><c-o>
    " vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    " Buffer local mappings.
    " See `:help vim.lsp.*` for documentation on any of the below functions
    nnoremap gD :lua vim.lsp.buf.declaration()<CR>
    nnoremap gd :lua vim.lsp.buf.definition()<CR>
    nnoremap K :lua vim.lsp.buf.hover()<CR>
    nnoremap gi :lua vim.lsp.buf.implementation()<CR>
    nnoremap gr :lua vim.lsp.buf.references()<CR>
    nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
    nnoremap <leader>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
    nnoremap <leader>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>
    nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
    nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
    vnoremap <space>ca :lua vim.lsp.buf.code_action()<CR>
augroup END
