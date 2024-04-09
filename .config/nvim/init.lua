-- Set <space> as the leader key
-- See `:help mapleader`
-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'
require 'keymaps'

require 'lazy-bootstrap'
require('lazy').setup('plugins', {
  ui = {
    border = 'rounded',
    backdrop = 100, -- Needs to be set to 100 due to https://github.com/neovim/neovim/issues/18576
  },
  dev = {
    path = '~/Developer/nvim/plugins',
  },
})
