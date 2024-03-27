return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'skim'
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'dhruvasagar/vim-table-mode',
    ft = 'markdown',
  },
}
