require("catppuccin").setup({
  flavour = "latte", -- latte, frappe, macchiato, mocha
  background = {         -- :h background
    light = "latte",
    dark = "macchiato",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
  term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,             -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,           -- percentage of the shade to apply to the inactive window
  },
  no_italic = true,             -- Force no italic
  no_bold = false,               -- Force no bold
  no_underline = false,          -- Force no underline
  styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },     -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = { "italic" },
    strings = {},
    variables = {},
    numbers = { "bold" },
    booleans = {},
    properties = {},
    types = {},
    operators = { "bold" },
  },
  color_overrides = {},
  custom_highlights = {
    -- Comment = { fg = "#8E95B3" },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
  },
})

vim.cmd.colorscheme "catppuccin"
-- vim.cmd.highlight('DiagnosticUnderlineError gui=undercurl')
-- vim.cmd.highlight('DiagnosticUnderlineWarn gui=undercurl')
-- vim.cmd.highlight('DiagnosticUnderlineInfo gui=undercurl')
-- vim.cmd.highlight('DiagnosticUnderlineHint gui=undercurl')
