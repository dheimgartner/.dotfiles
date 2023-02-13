-- Universe
require("neodev").setup()
require("fidget").setup()

-- Main setup happens there which leverages handlers and settings...
-- Enable the following language servers
-- Add/remove any LSPs that you want here. They will automatically be installed
-- The LSP settings can be configured in settings/<LSP>.lua
local servers = {
    "pyright",
    "lua_ls",  -- configure in settings
    "r_language_server",
}

-- Main setup
require("lsp-universe.handlers").setup()

require("mason").setup()

-- Ensure servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = servers,
})

-- Apply settings defined in settings/<LSP>.lua to servers
local lspconfig = require("lspconfig")

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp-universe.handlers").on_attach,
        capabilities = require("lsp-universe.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "lua.lsp-universe.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
