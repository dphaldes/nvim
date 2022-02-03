local use = require("packer").use
require("packer").startup({
	function()
		use("nvim-lua/plenary.nvim")
		use({ "wbthomason/packer.nvim" })
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			config = function()
				require("configs.treesitter").setup()
			end,
		})
		use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
		use({ "neovim/nvim-lspconfig" })

		use({
			"williamboman/nvim-lsp-installer",
			config = require("lsp"),
		})

		-- Completion
		use({ "onsails/lspkind-nvim", event = "BufRead" })
		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("configs.cmp")
			end,
			requires = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
				{ "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
				{ "hrsh7th/vim-vsnip", after = "nvim-cmp" },
			},
		})

		use({
			"folke/trouble.nvim",
			cmd = { "Trouble", "TroubleToggle" },
			config = function()
				require("trouble").setup()
			end,
		})
		use("jose-elias-alvarez/null-ls.nvim")
		use("kyazdani42/nvim-web-devicons")
		use("nvim-lualine/lualine.nvim")
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("bufferline").setup()
			end,
		})
		use("windwp/nvim-autopairs")
		use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })
		use({
			"j-hui/fidget.nvim",
			event = "BufRead",
			config = function()
				require("fidget").setup()
			end,
		})
		use("kyazdani42/nvim-tree.lua")
		use({
			"blackCauldron7/surround.nvim",
			config = function()
				require("surround").setup({ mappings_style = "surround" })
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = function()
				require("colorizer").setup()
			end,
		})
		-- use({
		-- 	"sunjon/Shade.nvim",
		-- 	config = function()
		-- 		require("shade").setup()
		-- 	end,
		-- })
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").opts)
			end,
		})
		-- use("lukas-reineke/indent-blankline.nvim")
		use("ahmedkhalf/project.nvim")
		use({ "rose-pine/neovim", as = "rose-pine" })
		-- use("folke/tokyonight.nvim")
		use({
			"abecodes/tabout.nvim",
			event = "InsertEnter",
			after = "nvim-treesitter",
			config = function()
				require("tabout").setup()
			end,
		})
		-- use({
		-- 	"HallerPatrick/py_lsp.nvim",
		-- 	config = function()
		-- 		require("py_lsp").setup()
		-- 	end,
		-- })
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
