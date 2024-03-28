return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add virtual text
    { 'theHamsta/nvim-dap-virtual-text', opts = {} },

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {
        codelldb = function(config)
          local pickers = require 'telescope.pickers'
          local finders = require 'telescope.finders'
          local conf = require('telescope.config').values
          local actions = require 'telescope.actions'
          local action_state = require 'telescope.actions.state'

          config.configurations = {
            {
              name = 'Launch an executable',
              type = 'executable',
              request = 'launch',
              cwd = '${workspaceFolder}',
              program = function()
                return coroutine.create(function(coro)
                  local opts = {}
                  pickers
                    .new(opts, {
                      prompt_title = 'Path to executable',
                      finder = finders.new_oneshot_job({ 'fd', '--hidden', '--no-ignore', '--type', 'x' }, {}),
                      sorter = conf.generic_sorter(opts),
                      attach_mappings = function(buffer_number)
                        actions.select_default:replace(function()
                          actions.close(buffer_number)
                          coroutine.resume(coro, action_state.get_selected_entry()[1])
                        end)
                        return true
                      end,
                    })
                    :find()
                end)
              end,
            },
          }
          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
      },

      ensure_installed = {
        'codelldb', -- General-purpose debugger
        'delve', -- Debugger for go
        'javadbg', -- Debug adapter for Java
        'javatest', -- Works with java-debug-adapter to provide support for debugging tests
      },
    }

    -- Basic debugging keymaps

    local continue = function()
      -- Load launch.json if it exists
      if vim.fn.filereadable '.vscode/launch.json' then
        require('dap.ext.vscode').load_launchjs()
      end
      require('dap').continue()
    end

    vim.keymap.set('n', '<F5>', function()
      if vim.bo.filetype == 'java' then
        require('jdtls.dap').setup_dap_main_class_configs {
          on_ready = function()
            continue()
          end,
        }
      else
        continue()
      end
    end, { desc = 'Debug: Start/Continue' })

    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {}

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
