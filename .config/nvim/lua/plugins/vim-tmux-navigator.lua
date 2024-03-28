return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<C-w><C-h>', '<cmd>TmuxNavigateLeft<cr>' },
      { '<C-w><C-j>', '<cmd>TmuxNavigateDown<cr>' },
      { '<C-w><C-k>', '<cmd>TmuxNavigateUp<cr>' },
      { '<C-w><C-l>', '<cmd>TmuxNavigateRight<cr>' },
      { '<C-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
    },
    init = function()
      vim.g.tmux_navigator_no_mappings = true
    end,
  },
}
