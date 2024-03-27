return {
  { -- Simple file explorer
    'lmburns/lf.nvim',
    lazy = false,
    cmd = 'Lf',
    dependencies = { 'akinsho/toggleterm.nvim', version = '*', config = true }, -- Runs require("toggleterm").setup()
    config = function()
      -- This feature will not work if the plugin is lazy-loaded
      vim.g.lf_netrw = 1
      require('lf').setup {
        winblend = 0, -- Needs to be 0 because of https://github.com/neovim/neovim/issues/18576
        border = 'rounded', -- Hence border
        highlights = { NormalFloat = { guibg = 'NONE' } },
        escape_quit = true,
        default_file_manager = true,
      }

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LfTermEnter',
        callback = function(a)
          vim.api.nvim_buf_set_keymap(a.buf, 't', 'q', 'q', { nowait = true })
        end,
      })
    end,
    keys = {
      { '<leader>lf', '<cmd>Lf<cr>', desc = 'lf' },
    },
  },
}
