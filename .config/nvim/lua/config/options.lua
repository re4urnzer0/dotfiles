-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
vim.opt.list = false

if vim.g.neovide then
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_normal_opacity = 0.95
  vim.g.neovide_theme = "auto"
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
