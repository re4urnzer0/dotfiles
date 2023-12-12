local keymap = vim.keymap
local opts = {noremap = true, silent = true}

-- General
keymap.set("n", "qq", "<CMD>q<CR>", opts)
keymap.set("n", "qw", "<CMD>wq<CR>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-j>", function ()
    vim.diagnostic.goto_next()
end)

-- Symbol-outline
keymap.set("n", "<C-m>", "<CMD>SymbolsOutline<CR>", opts)
