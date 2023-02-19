-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup()

-- See `:help telescope.builtin`
local keymap = require("utils").keymap

local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }

local themes = require("telescope.themes")
keymap("n", "<leader>?", builtin.oldfiles, opts, "[?] Find recently opened files")
keymap("n", "<leader><space>", builtin.buffers, opts, "[ ] Find existing buffers")
keymap("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(themes.get_dropdown({
        previewer = false,
    }))
end, opts, "[/] Fuzzy search in current buffer")
keymap("n", "<leader>sf", builtin.find_files, opts, "[S]earch [F]iles")
keymap("n", "<leader>sh", builtin.help_tags, opts, "[S]earch [H]elp")
keymap("n", "<leader>sc", builtin.commands, opts, "[S]earch [C]ommands")
keymap("n", "<leader>sk", builtin.keymaps, opts, "[S]earch [K]eymaps")
keymap("n", "<leader>sw", builtin.grep_string, opts, "[S]earch current [W]ord")
keymap("n", "<leader>sg", builtin.live_grep, opts, "[S]earch by [G]rep")
keymap("n", "<leader>sd", builtin.diagnostics, opts, "[S]earch [D]iagnostics")
