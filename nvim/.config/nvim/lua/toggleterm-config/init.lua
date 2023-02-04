require("toggleterm").setup({
	open_mapping = [[<space>ct]],
	direction = "horizontal",
	size = function(term)
		if term.direction == "float" then
			return 20
		else
			return 25
		end
	end,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<c-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<c-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<c-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<c-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

-- Custom terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
	lazygit:toggle()
end

local r_console = Terminal:new({ cmd = "radian" , hidden = true })

function _r_console_toggle()
	r_console:toggle()
end

local i_python = Terminal:new({ cmd = "ipython", hidden = true })

function _i_python_toggle()
	i_python:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })

function _htop_toggle()
	htop:toggle()
end

local keymap = vim.keymap.set

keymap("n", "<leader>cr", _r_console_toggle, { noremap = true, silent = true, desc = "radian" })
keymap("n", "<leader>cp", _i_python_toggle, { noremap = true, silent = true, desc = "ipython" })
keymap("n", "<leader>G", _lazygit_toggle, { noremap = true, silent = true, desc = "Lazygit" })
keymap("n", "<leader>H", _htop_toggle, { noremap = true, silent = true, desc = "htop" })
