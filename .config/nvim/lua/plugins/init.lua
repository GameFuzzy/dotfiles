return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive', -- Git commands
  { 'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' } }, -- Shows the context of the currently visible buffer contents
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
  {
    'lervag/vimtex',
    init = function()
      vim.g.vimtex_view_method = 'skim'
    end,
  },
  {
    'dhruvasagar/vim-table-mode',
    ft = 'markdown',
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
    init = function()
      vim.g.rustaceanvim = {
        dap = { autoload_configurations = true },
      }
    end,
  },
}
