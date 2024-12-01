set noshowmode

lua << EOF
require('lualine').setup({
	options = {
		-- theme = {
		-- 	normal = {
		-- 		a = {bg = s:green["gui"], fg = s:grey["gui"] }
		-- 	}
		-- }
		component_separators = {
			left = '',
			right = '',
		},
		section_separators = {
			left = '',
			right = '',
		},
	},
})
EOF
