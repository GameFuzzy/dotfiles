return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    opts = {},
    keys = {
      {
        '<C-b>',
        function()
          require('harpoon').ui:toggle_quick_menu(require('harpoon'):list(), {
            border = 'rounded',
            title_pos = 'center',
            ui_width_ratio = 0.40,
          })
        end,
        desc = 'Open harpoon window',
      },

      {
        '<leader>a',
        function()
          require('harpoon'):list():add()
        end,
        desc = '[A]dd buffer to harpoon list',
      },

      {
        '<leader>dd',
        function()
          require('harpoon'):list():clear()
        end,
        desc = 'Clear harpoon list',
      },

      {
        '<C-h>',
        function()
          require('harpoon'):list():select(1)
        end,
      },
      {
        '<C-j>',
        function()
          require('harpoon'):list():select(2)
        end,
      },
      {
        '<C-k>',
        function()
          require('harpoon'):list():select(3)
        end,
      },
      {
        '<C-l>',
        function()
          require('harpoon'):list():select(4)
        end,
      },

      -- Toggle previous & next buffers stored within Harpoon list
      {
        '<C-S-P>',
        function()
          require('harpoon'):list():prev()
        end,
      },
      {
        '<C-S-N>',
        function()
          require('harpoon'):list():next()
        end,
      },
    },
  },
}
