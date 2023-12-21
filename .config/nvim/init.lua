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
    -- misc
    require('notify').setup({
        background_colour = "#000000",
    })

    -- Plugins
    require('module')
end
