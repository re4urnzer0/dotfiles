-- Loaded config files

if vim.g.vscode then
    --- VScode extensions
    vim.opt.hlsearch = false
else
    -- Bases
    require('base/options')
    require('base/keymaps')
    --Plugins
    -- lazy.nvim
    require('plugins')
    -- Color Scheme
    require('cs')

    -- Plugins
    -- autoclose.nvim
    require('module.ac')
    -- indent-blankline.nvim
    require('module.indent')
    -- neo-tree.nvim
    require('module.sidebar')
    -- alpha.nvim
    require('module.startup')
    -- barbar.nvim
    require('module.tabline')
    -- telescope.nvim
    require('module.ts')
    -- LSP
    require('module.lsp')
    -- nvim-cmp
    require('module.nvim-cmp')
    -- neoscroll.nvim
    require('module.scroll')
    -- cursorline.nvim
    require('module.cursorline')
    -- treesitter.nvim
    require('module.treesitter')
    -- lualine.nvim
    require('module.statusline')
    -- noice.nvim
    require('module.notice')
    -- trouble.nvim
    require('module.diag')
    -- symbol-outline.nvim
    require('module.outline')
    -- gitsigns.nvim
    require('module.git')
end
