return {
  require 'plugins.lsp.lspconfig',

  -- Extra
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
  require 'plugins.lsp.jdtls',
}
