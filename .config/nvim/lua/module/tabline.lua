local bufferline = require('bufferline')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Mappings
keymap.set("n", "<A-,>", "<CMD>BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<A-.>", "<CMD>BufferLineCycleNext<CR>", opts)
keymap.set("n", "<A-c>", "<CMD>bd<CR>", opts)
keymap.set("n", "<leader>g1", "<CMD>BufferLineGoToBuffer 1<CR>", opts)
keymap.set("n", "<leader>g2", "<CMD>BufferLineGoToBuffer 2<CR>", opts)
keymap.set("n", "<leader>g3", "<CMD>BufferLineGoToBuffer 3<CR>", opts)
keymap.set("n", "<leader>g4", "<CMD>BufferLineGoToBuffer 4<CR>", opts)
keymap.set("n", "<leader>g5", "<CMD>BufferLineGoToBuffer 5<CR>", opts)
keymap.set("n", "<leader>g6", "<CMD>BufferLineGoToBuffer 6<CR>", opts)
keymap.set("n", "<leader>g7", "<CMD>BufferLineGoToBuffer 7<CR>", opts)
keymap.set("n", "<leader>g8", "<CMD>BufferLineGoToBuffer 8<CR>", opts)
keymap.set("n", "<leader>g9", "<CMD>BufferLineGoToBuffer 9<CR>", opts)
keymap.set("n", "<leader>g0", "<CMD>BufferLineGoToBuffer 0<CR>", opts)
bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.no_italic,
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
