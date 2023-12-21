require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'clangd', 'pylsp' },
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
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
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

-- lsp_signature
cfg = {
    debug = false,                                            -- set to true to enable debug logging
    log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
    -- default is  ~/.cache/nvim/lsp_signature.log
    verbose = false,                                          -- show debug line number

    bind = true,                                              -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 10,                                           -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- set to 0 if you DO NOT want any API comments be shown
    -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- mode, 10 by default

    max_height = 12,                     -- max height of signature floating_window
    max_width = 80,                      -- max_width of signature floating_window, line will be wrapped if exceed max_width
    -- the value need >= 40
    wrap = true,                         -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
    floating_window = true,              -- show hint in a floating window, set to false for virtual text only mode

    floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
    -- will set to true when fully tested, set to false will use whichever side has more space
    -- this setting will be helpful if you do not want the PUM and floating win overlap

    floating_window_off_x = 1, -- adjust float windows x position.
    -- can be either a number or function
    floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
    -- can be either number or function, see examples

    close_timeout = 4000, -- close floating window after ms when laster parameter is entered
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
    hint_scheme = "String",
    hint_inline = function() return false end, -- should the hint be inline(nvim 0.10 only)?  default false
    -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
    -- return 'right_align' to display hint right aligned in the current line
    hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
    handler_opts = {
        border = "rounded"                      -- double, rounded, single, shadow, none, or a table of borders
    },

    always_trigger = false,                 -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

    auto_close_after = nil,                 -- autoclose signature float win after x sec, disabled if nil.
    extra_trigger_chars = {},               -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    zindex = 200,                           -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

    padding = '',                           -- character to pad on left and right of signature can be ' ', or '|'  etc

    transparency = nil,                     -- disabled by default, allow floating win transparent value 1~100
    shadow_blend = 36,                      -- if you using shadow as border use this set the opacity
    shadow_guibg = 'Black',                 -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
    timer_interval = 200,                   -- default timer check interval set to lower value if you want to reduce latency
    toggle_key = nil,                       -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
    -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
    -- may not popup when typing depends on floating_window setting

    select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
    move_cursor_key = nil,    -- imap, use nvim_set_current_win to move cursor between current win and floating
}


-- recommended:
require 'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
require 'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
