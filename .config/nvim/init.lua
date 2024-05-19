-- Loaded config files

-- vscode.nvim
if vim.g.vscode then
  --- VScode extensions
  require('base.options')
else
  -- Bases
  require('base')

  -- lazy.nvim
  require('pluginmgr')

  -- Plugins
  require('module')
end
