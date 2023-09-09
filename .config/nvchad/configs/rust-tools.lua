local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
				},
			},
		},
	},
}

return options
