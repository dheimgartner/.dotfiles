vim.g.mapleader = " "

-- Taken from which-key docu
local default_opts = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local wk = require("which-key")

local telescope = require("telescope.builtin")

wk.register({
	["<leader>"] = {
		f = {
			name = "+file & find",
			f = { telescope.find_files, "Find File" },
			g = { telescope.live_grep, "Live Grep" },
			b = { telescope.buffers, "Buffers" },
			h = { telescope.help_tags, "Help Tags" },
		},

		o = {
			name = "+own stuff",
			h = {
				function()
					print("hello world")
				end,
				"Hello World",
			},
		},

		t = { ":NvimTreeToggle<cr>", "File Explorer" },
	},

	["<c-h>"] = { "<c-w>h", "Window Left" },
    ["<c-j>"] = { "<c-w>j", "Window Down" },
	["<c-k>"] = { "<c-w>k", "Window Up" },
	["<c-l>"] = { "<c-w>l", "Window Right" },
	["<c-c>"] = { "<c-w>c", "Window Close" },

    ["<c-n>"] = { ":bnext<cr>", "Buffer Next" },
    ["<c-p>"]= { ":bprevious<cr>", "Buffer Previous" },

	["jk"] = { "<esc>", "Normal Mode", mode = "i" },

	-- more mappings (groups or not)
})
