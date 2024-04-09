return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
      'lawrence-laz/neotest-zig',
      'nvim-neotest/neotest-vim-test',
      'vim-test/vim-test',
    },
    config = function()
      -- recommended by neotest-go
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)

      local neotest = require 'neotest'
      neotest.setup {
        adapters = {
          require 'rustaceanvim.neotest',
          require 'neotest-go',
          require 'neotest-zig',
          require 'neotest-vim-test' { ignore_filetypes = { 'rust', 'go', 'zig' } },
        },
      }
    end,
    keys = {
      {
        '<leader>tt',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run nearest [T]est',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = '[D]ebug nearest test',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run { vim.fn.expand '%' }
        end,
        desc = 'Test current [F]ile',
      },
    },
  },
}
