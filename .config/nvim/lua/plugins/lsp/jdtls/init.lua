return {
  { -- Java LSP
    'mfussenegger/nvim-jdtls',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    ft = { 'java' },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        desc = 'Sets up and attaches jdtls to each buffer',
        group = vim.api.nvim_create_augroup('jdtls_lsp', { clear = true }),
        callback = function()
          require('plugins.jdtls.setup').setup()
        end,
      })
    end,
  },
}
