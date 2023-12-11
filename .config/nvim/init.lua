-- Loaded config files

if vim.g.vscode then
    --- VScode extensions
    vim.opt.hlsearch = false
else
    -- Bases
    require('base')

    -- lazy.nvim
    require('pluginmgr')

    -- Color Scheme
    require('cs')

    -- Plugins
    require('module')
end
