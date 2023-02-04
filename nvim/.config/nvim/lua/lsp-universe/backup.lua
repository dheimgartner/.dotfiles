local lspconfig = require("lspconfig")
local wk = require("which-key")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
wk.register({
	["<leader>"] = {
		l = {
			name = "+LSP",
			e = { vim.diagnostic.open_float, "LSP Show Diagnostic" },
			q = { vim.diagnostic.setloclist, "LSP Add Diagnostic to Local List" },
			d = {
				name = "+diagnostic",
				p = { vim.diagnostic.goto_prev, "LSP Diagnostic Previous" },
				n = { vim.diagnostic.goto_next, "LSP Diagnostic Next" },
			},
		},
	},
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	wk.register({
		["<leader>"] = {
			l = {
				name = "+LSP",
				g = {
					name = "+goto",
					D = { vim.lsp.buf.declaration, "Goto Declaration", bufopts },
					d = { vim.lsp.buf.definition, "Goto Definition", bufopts },
					i = { vim.lsp.buf.implementation, " ", bufopts },
				},
				K = { vim.lsp.buf.hover, " ", bufopts },
				k = { vim.lsp.buf.signature_help, " ", bufopts },
				w = {
					name = "+workspace",
					a = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder", bufopts },
					r = { vim.lsp.remove_workspace_folder, "Remove Workspace Folder", bufopts },
					l = {
						function()
							print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
						end,
						"List Workspace Folders",
						bufopts,
					},
				},
				["td"] = { vim.lsp.buf.type_definition, " ", bufopts },
				["rn"] = { vim.lsp.buf.rename, " ", bufopts },
				["ca"] = { vim.lsp.buf.code_action, " ", bufopts },
				["gr"] = { vim.lsp.buf.references, " ", bufopts },
			},
		},
		F = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Format",
			bufopts,
		},
	})
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Instead of showing text you can access via <leader>e (see above)...
local config = {
	virtual_text = false,
}

vim.diagnostic.config(config)

-- Language specific
lspconfig["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

lspconfig["r_language_server"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
