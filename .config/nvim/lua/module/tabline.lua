local bufferline = require('bufferline')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Mappings
keymap.set("n", "<A-,>", "<CMD>BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<A-.>", "<CMD>BufferLineCycleNext<CR>", opts)
keymap.set("n", "<A-c>", "<CMD>bd<CR>", opts)

bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.no_italic,
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
