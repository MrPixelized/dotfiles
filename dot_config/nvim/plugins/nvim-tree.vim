lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)

-- OR setup with some options
require("nvim-tree").setup({
  view = {
    adaptive_size = false,
    --mappings = {
    --  list = {
    --    { key = "u", action = "dir_up" },
    --  },
    --},
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

let g:nvim_tree_highlight_opened_files = 1
