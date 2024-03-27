return {
  { -- Makes background transparent
    'xiyaowong/transparent.nvim',
    config = function()
      local transparent = require 'transparent'
      -- transparent.clear_prefix 'lualine'
    end,
  },
}
