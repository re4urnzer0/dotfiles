local keymap = vim.keymap
local opts = {noremap = true, silent = true}

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", "<CMD>split<CR>", opts)
keymap.set("n", "sv", "<CMD>vs<CR>", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function ()
    vim.diagnostic.goto_next()
end)

-- Symbol-outline
keymap.set("n", "<C-m>", "<CMD>SymbolsOutline<CR>", opts)
