if vim.g.vscode then
  require('base')
else
  require('base')
  require('config.lazy')
end
-- neovide config
if vim.g.neovide then
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_normal_opacity = 0.95
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
