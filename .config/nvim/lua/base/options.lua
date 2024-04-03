-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus' -- use system clipboard

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Enable mouse
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

-- General
vim.opt.tabstop = 2          -- number of visual spaces per TAB
vim.opt.softtabstop = 2      -- number of spacesin tab when editing
vim.opt.shiftwidth = 2       -- insert 4 spaces on a tab
vim.opt.expandtab = true     -- tabs are spaces, mainly because of python
vim.opt.number = true        -- show absolute number
vim.opt.relativenumber = true
vim.opt.cursorline = true    -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true    -- open new vertical split bottom
vim.opt.splitright = true    -- open new horizontal splits right
vim.opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false     -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 10

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Searching
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- Useful autocmd

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Simple code running
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
