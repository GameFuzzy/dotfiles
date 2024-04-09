return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function(_, _)
      local trouble = require 'trouble'
      local symbols = trouble.statusline {
        mode = 'lsp_document_symbols',
        groups = {},
        title = false,
        filter = { range = true },
        format = '{kind_icon}{symbol.name}',
      }
      return {
        options = {
          theme = 'auto',
        },
        sections = {
          lualine_b = { 'diff', 'diagnostics' },
          lualine_c = { 'filename', { symbols.get, cond = symbols.has } },
        },
      }
    end,
  },
}
