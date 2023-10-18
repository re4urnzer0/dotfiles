local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- ColorScheme
    use { "catppuccin/nvim", as = "catppuccin" }
    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    -- Auto close
    use 'm4xshen/autoclose.nvim'
    -- Status line
    use { 'nvim-lualine/lualine.nvim' }
    -- Tags
    use { 'lewis6991/gitsigns.nvim' }
    use { 'romgrk/barbar.nvim' }
    -- Ident
    use { 'lukas-reineke/indent-blankline.nvim' }
    -- Cursor line
    use { 'yamatsum/nvim-cursorline' }
    -- Surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    -- LSP about
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }  -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }    -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'p00f/clangd_extensions.nvim'
    use {
        "ray-x/lsp_signature.nvim",
    }
    -- Kind icon
    use { 'onsails/lspkind.nvim' }
    -- Dashboard
    use {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }
    -- fzf about
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
