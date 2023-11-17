 require("neo-tree").setup({
     window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          }
    }
 })
vim.keymap.set('n', '<A-n>', ':Neotree toggle<CR>')
