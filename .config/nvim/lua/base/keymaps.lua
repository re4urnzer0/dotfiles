local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- General
keymap.set("n", "qq", "<CMD>q!<CR>", opts)
keymap.set("n", "qw", "<CMD>wq<CR>", opts)
keymap.set("n", "<A-w>", "<C-w>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end)

-- Symbol-outline (Lspsaga)
keymap.set("n", "<C-m>", "<CMD>Lspsaga outline<CR>", opts)

