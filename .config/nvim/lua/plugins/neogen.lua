return { -- Creates annotations
  'danymat/neogen',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    local neogen = require 'neogen'

    neogen.setup {
      snippet_engine = 'luasnip',
    }
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  keys = {
    {
      '<leader>nf',
      function()
        require('neogen').generate { type = 'func' }
      end,
      desc = 'Generate [F]unction annotation',
    },
    {
      '<leader>nt',
      function()
        require('neogen').generate { type = 'type' }
      end,
      desc = 'Generate [T]ype annotation',
    },
  },
}
