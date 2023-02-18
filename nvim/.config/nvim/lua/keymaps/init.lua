-- Note: package specific keymaps are in the respective
-- repository (unless few exceptions ;)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = require("helpers").keymap

local opts = { noremap = true, silent = true }

keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

keymap("i", "jk", "<ESC>", opts)

-- nvimtree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, opts, "Goto previous [D]iagnostic")
keymap("n", "]d", vim.diagnostic.goto_next, opts, "Goto next [D]iagnostic")
keymap("n", "<leader>e", vim.diagnostic.open_float, opts, "vim.diagnostic.open_float")
keymap("n", "<leader>q", vim.diagnostic.setloclist, opts, "vim.diagnostic.setloclist")

-- Hello world
keymap("n", "<leader>hw", function()
	print("hello world")
end)

-- Window management
keymap("n", "<C-h>", "<C-W>h", opts)
keymap("n", "<C-j>", "<C-W>j", opts)
keymap("n", "<C-k>", "<C-W>k", opts)
keymap("n", "<C-l>", "<C-W>l", opts)
keymap("n", "<C-c>", "<C-W>c", opts)

-- Resizes
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)

-- Buffers
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-p>", ":bprevious<CR>", opts)
keymap("n", "<C-d>", ":bdelete<CR>", opts)
