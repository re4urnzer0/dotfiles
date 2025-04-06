-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require("telescope.actions")
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set
    map('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
    map('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind by [G]rep" })
    map('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })
    map('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp" })
    map('n', '<leader>of', builtin.oldfiles, { desc = "[F]ind [O]ldfiles " })
    map('n', '<leader>sk', builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    map('n', '<leader>:', builtin.command_history, { desc = "[C]ommand [H]istory" })
    map('n', '<leader>sm', '<CMD>Telescope noice<CR>', opts)
    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-J>"] = actions.move_selection_next,
            ["<C-K>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_tab,
            ["<C-DOWN>"] = require('telescope.actions').cycle_history_next,
            ["<C-UP>"] = require('telescope.actions').cycle_history_prev,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
  end,
}
