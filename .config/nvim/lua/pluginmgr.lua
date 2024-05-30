-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },

  -- Pairs
  {
    'm4xshen/autoclose.nvim',
    opt = {},
    config = function()
      require("autoclose").setup()
    end
  },
  -- Startup
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },
  -- Side bar
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- Fzf
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
  },
  -- Auto Complete

  {
    'hrsh7th/nvim-cmp',
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },  -- buffer auto-completion
  { 'hrsh7th/cmp-path' },    -- path auto-completion
  { 'hrsh7th/cmp-cmdline' }, -- cmdline auto-completion
  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  { 'saadparwaiz1/cmp_luasnip' },
  -- LSP
  {
    'neovim/nvim-lspconfig',
  },
  {
    'williamboman/mason.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',
  },
  { 'onsails/lspkind.nvim' },
  {
    'p00f/clangd_extensions.nvim',
    config = function()
      require("clangd_extensions").setup({})
    end
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {
        lightbulb = {
          debounce = 100,
          enable = false,
        },
      }
    end,
  },
  -- Comment
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
    config = function()
      require('Comment').setup()
    end
  },
  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- Motion
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = false,      -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  -- Tabline
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  -- Git sup
  {
    'lewis6991/gitsigns.nvim',
  },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})
