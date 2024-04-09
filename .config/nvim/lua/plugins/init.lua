return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive', -- Git commands
  { 'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' } }, -- Shows the context of the currently visible buffer contents
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
  {
    'lervag/vimtex',
    lazy = false, -- Do not lazy load
    init = function()
      vim.g.vimtex_view_method = 'skim'
      -- vim.g.vimtex_grammar_textidote = {
      --   jar = '/usr/local/bin/textidote.jar',
      --   args = '--check en',
      -- }
    end,
  },
  {
    'dhruvasagar/vim-table-mode',
    ft = 'markdown',
  },
}
