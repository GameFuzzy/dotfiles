local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier,
	formatting.stylua,
	formatting.gofmt,
	formatting.goimports_reviser,
	formatting.clang_format,
	formatting.rustfmt,
	formatting.latexindent,
	formatting.bibclean,

	lint.cpplint.with({
		args = { "--filter='-legal/copyright'", "$FILENAME" },
	}),
	lint.cppcheck,
	lint.shellcheck,
	lint.fish,
	lint.textidote, -- LaTeX and Markdown linter
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = sources,
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
