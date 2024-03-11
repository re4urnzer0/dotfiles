require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- format uses clangd-format and stylua.
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'clangd', 'pylsp', 'cmake' },
})

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP atteches to a given buffer
local lspconfig = require('lspconfig')

vim.diagnostic.config({
  virtual_text = false,
})

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- Diagnostics
vim.keymap.set("n", "<C-j>", "<CMD>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<C-k>", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

  -- Lspsaga
  -- Definition
  --    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gd', '<CMD>Lspsaga goto_definition<CR>', bufopts)
  vim.keymap.set('n', 'sd', '<CMD>Lspsaga peek_definition<CR>', bufopts)
  vim.keymap.set('n', '<space>gd', '<CMD>Lspsaga goto_definition<CR>', bufopts)
  vim.keymap.set('n', '<space>sd', '<CMD>Lspsaga peek_type_definition<CR>', bufopts)
  -- Hover
  --    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>')
  -- Code_action
  --    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>ca', '<CMD>Lspsaga code_action<CR>', bufopts)
  -- Outline
  vim.keymap.set("n", "<C-m>", "<CMD>Lspsaga outline<CR>", opts)

  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<A-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Apply to languages
-- Python
lspconfig.pylsp.setup({
  on_attach = on_attach,
})
-- Lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
})
-- C/CPP
lspconfig.clangd.setup({
  on_attach = on_attach,
})
-- Cmake
lspconfig.cmake.setup({
  on_attach = on_attach,
})
-- Rust
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
})
