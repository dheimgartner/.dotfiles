-- https://github.com/LunarVim/Neovim-from-scratch/tree/master/lua/user/lsp
-- Will be required in mason.lua

local M = {}

-- nvim-cmp supports additional completion capabilities, so broadcast to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Keymaps
local nmap = function(bufnr, keys, func, desc)
    if desc then
        desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

local lsp_keymaps = function(bufnr)

    local builtin = require("telescope.builtin")

    nmap(bufnr, "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ames all the references under cursor")
    nmap(bufnr, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap(bufnr, "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap(bufnr, "gr", builtin.lsp_references, "[G]oto [R]eferences")
    nmap(bufnr, "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap(bufnr, "<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap(bufnr, "<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap(bufnr, "<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- See `:help K`
    nmap(bufnr, "K", vim.lsp.buf.hover, "Hover documentation")
    nmap(bufnr, "<C-space>", vim.lsp.buf.signature_help, "[S]ignature documentation")

    -- Lesser used LSP functionality
    nmap(bufnr, "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap(bufnr, "<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd folder")
    nmap(bufnr, "<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap(bufnr, "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format({ timeout_ms = 3000 })
    end, { desc = "Format current buffer with LSP" })
end

-- LSP settings
-- This function gets run when an LSP connects to a particular buffer
M.on_attach = function(_, bufnr)
    lsp_keymaps(bufnr)
end

M.setup = function()
    local config = {
        virtual_text = false,
    }

    vim.diagnostic.config(config)
end

return M
