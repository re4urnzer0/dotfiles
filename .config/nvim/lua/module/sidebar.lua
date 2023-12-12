require("neo-tree").setup({
    window = {
        position = "left",
        width = 25,
        mapping_options = {
            noremap = true,
            nowait = true,
        }
    },
    filesystem = {
        filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = false,
        }
    },
})
vim.keymap.set('n', '<A-n>', '<CMD>Neotree toggle<CR>')
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { italic = false })
vim.api.nvim_set_hl(0, "NeoTreeRootName", { italic = false })
