require('plugins')
require('options')
require('keymaps')
require('config/statusline')
require('config/indent')
require('config/cursorline')
require('config/surround')
require('config/nvim-cmp')
require('config/lsp')
require('config/alpha')

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.cmd.colorscheme "catppuccin-macchiato"
