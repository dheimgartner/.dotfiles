local packer = require("packer")

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float()
		end,
	},
})

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("folke/tokyonight.nvim")
	use({
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup()
		end,
	})

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")

	use("L3MON4D3/LuaSnip")

	use({
        "neovim/nvim-lspconfig",
        requires = {
            -- Easily (if you want automatically) install LSP servers,
            -- DAP servers, linters and formatters.
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "j-hui/fidget.nvim",
            -- Neovim setup for init.lua and plugin development with full
            -- signature help, docs and completion for the nvim lua API.
            "folke/neodev.nvim"
        },
    })

	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
        -- Comment back in (telescope.builtin.current_buffer_fuzzy_find bug)
		-- tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

    use("lukas-reineke/indent-blankline.nvim")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

	use("nvim-tree/nvim-web-devicons")
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-web-devicons",
		},
	})

    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
    })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-web-devicons" },
	})

	use({
		"romgrk/barbar.nvim",
		wants = { "nvim-web-devicons" },
	})

    use("jpalardy/vim-slime")

    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")

end)
