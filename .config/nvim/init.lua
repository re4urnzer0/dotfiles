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

  -- self
  local function split()
    vim.cmd('set splitright')
    vim.cmd('vsp')
  end

  function codeRun()
    split()
    if vim.bo.filetype == 'cpp' then
      vim.cmd('term g++ "%" -o "%<" && ./"%<"')
    elseif vim.bo.filetype == 'python' then
      split()
      vim.cmd('term python3 "%"')
    end
  end
end
