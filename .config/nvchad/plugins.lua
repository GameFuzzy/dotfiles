local plugins = {
  {
    "NvChad/nvterm",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "rust-analyzer",
      },
    },
  },
  {
    "lmburns/lf.nvim",
    cmd = "Lf",
    dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
    opts = {
      winblend = 0,
      highlights = { NormalFloat = { guibg = "NONE" } },
      border = "single",
      escape_quit = true,
    },
    keys = {
      { "<leader>lf", "<cmd>Lf<cr>", desc = "Lf" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

        -- low level
        "c",
        "zig",
        "rust",

        -- other
        "python",
        "c_sharp",

        -- shells
        "fish",
        "bash",

        -- git
        "git_config",
        "git_rebase",
        "gitignore",

        -- misc
        "comment",
        "yaml",
        "dockerfile",
      },
    },
  },
}
return plugins
