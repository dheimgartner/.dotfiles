-- Hooks into lsp stuff

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.black,
		diagnostics.flake8,
		formatting.format_r,
	},
})
