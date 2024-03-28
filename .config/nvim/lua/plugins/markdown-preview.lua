return { -- Allows previewing Markdown files in a browser
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_browser = 'Firefox'
    end,
    keys = {
      { '<leader>p', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Preview Markdown' },
    },
  },
}
