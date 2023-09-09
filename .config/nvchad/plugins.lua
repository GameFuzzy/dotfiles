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
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
			crates.show()
			require("core.utils").load_mappings("crates")
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			require("custom.configs.nvim-jdtls")
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
				"gopls",
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
			{ "<leader>lf", "<cmd>Lf<cr>", desc = "lf" },
		},
	},
	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
		opts = {
			tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
			backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
			act_as_tab = true, -- shift content if tab out is not possible
			act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
			default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
			default_shift_tab = "<C-d>", -- reverse shift default action,
			enable_backwards = true, -- well ...
			completion = true, -- if the tabkey is used in a completion pum
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
			exclude = {}, -- tabout will ignore these filetypes
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
				"cpp",
				"zig",
				"rust",

				-- other
				"python",
				"c_sharp",
				"java",
				"go",

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
	{
		"mfussenegger/nvim-dap",
		init = function()
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function(_, opts)
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
return plugins
