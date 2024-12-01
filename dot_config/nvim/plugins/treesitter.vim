lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = 'maintained',
	highlight = {
		enable = true,
	},
	-- incremental_selection = {
	-- 	enable = true,
	-- 	keymaps = {
	-- 		init_selection = 'gsi',
	-- 		node_incremental = 'gsn',
	-- 		scope_incremental 'gss',
	-- 		node_decremental = 'gsd',
	-- 	},
	-- },
	indent = {
		enable = true,
	},
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
