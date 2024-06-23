local ft = require('guard.filetype')

ft('c'):fmt('clang-format')

ft('lua'):fmt('lsp')

ft('cpp'):fmt('clang-format')

-- Call setup() LAST!
require('guard').setup({
  -- Choose to format on every write to a buffer
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = false,
  -- By default, Guard writes the buffer on every format
  -- You can disable this by setting:
  -- save_on_fmt = false,
})
