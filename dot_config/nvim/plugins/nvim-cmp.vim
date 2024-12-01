lua << EOF
local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' },
		{ name = 'buffer' },
		{ name = 'calc' },
		{ name = 'git' },
	},

	completion = {
		completeopt='menuone,noselect,longest',
	},

	snippet = {
		expand = function(args)
			--vim.api.nvim_command('echo ' + args)
			vim.fn['UltiSnips#Anon'](args.body)
		end,
	},

	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	},
})

cmp.setup.cmdline({'/', '?'}, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'cmdline' },
		{ name = 'path' }
	}
})
EOF

autocmd FileType tex lua require'cmp'.setup.buffer {
\	sources = {
\		{ name = 'nvim_lsp' },
\		{ name = 'ultisnips' },
\		{ name = 'buffer' },
\		{ name = 'calc' },
\		{ name = 'latex_symbols' },
\	},
\}
