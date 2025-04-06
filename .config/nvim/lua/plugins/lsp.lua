return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
      })
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          enable = false,
        }
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    },
  },

  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        -- vim.keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>')
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
        vim.keymap.set('n', '<space>rn', '<CMD>Lspsaga rename<CR>', bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end
      -- Set up lspconfig
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.marksman.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  }
}
