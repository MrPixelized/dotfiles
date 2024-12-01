let g:coq_settings = {
	\'auto_start': 'shut-up',
	\'keymap': {
		\'jump_to_mark': '<c-j>',
	\},
	\'display': {
		\'pum': {
			\'source_context': ['[', ']'],
			\'kind_context': ['[', ']'],
		\},
		\'preview': {
			\'border': [
				\["", "NormalFloat"],
				\["", "NormalFloat"],
				\["", "NormalFloat"],
				\[" ", "NormalFloat"],
				\["", "NormalFloat"],
				\["", "NormalFloat"],
				\["", "NormalFloat"],
				\[" ", "NormalFloat"]
			\],
			\'positions': { 'east': 1, 'north': 2, 'south': 3, 'west': 4 },
		\},
		\'icons': {
			\'mode': 'none',
		\},
	\},
\}

lua << EOF
require("coq_3p") {
	{ src = "vimtex", short_name = "TEX" },
	{ src = "bc", short_name = "CAL" },
}
EOF
