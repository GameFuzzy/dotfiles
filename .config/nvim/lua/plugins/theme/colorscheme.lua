return {
  { -- Selenized colorscheme
    'loganswartz/selenized.nvim',
    dependencies = {
      'rktjmp/lush.nvim',
    },
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'my-selenized'

      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
}
