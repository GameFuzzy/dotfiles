local M = {}

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Window up" },

		["<S-h>"] = { "<cmd> bprevious <CR>", "Next buffer" },
		["<S-l>"] = { "<cmd> bnext <CR>", "Previous buffer" },
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
		["<leader>b"] = {
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		["<leader>B"] = {
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
		},
		["<leader>lp"] = {
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
		},
		["<leader>dr"] = {
			function()
				require("dap").repl.open()
			end,
		},
		["<leader>dl"] = {
			function()
				require("dap").run_last()
			end,
		},
		["<F5>"] = {
			function()
				require("dap").continue()
			end,
		},
		["<F10>"] = {
			function()
				require("dap").step_over()
			end,
		},
		["<F11>"] = {
			function()
				require("dap").step_into()
			end,
		},
		["<F12>"] = {
			function()
				require("dap").step_out()
			end,
		},
	},
}

M.crates = {
	plugin = true,
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"Update crates",
		},
	},
}

return M
