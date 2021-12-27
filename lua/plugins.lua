local use = require("packer").use
require("packer").startup({
	function()
		use("wbthomason/packer.nvim")
		use("nvim-treesitter/nvim-treesitter")
		use("p00f/nvim-ts-rainbow")
		use("neovim/nvim-lspconfig")

		-- Completion
		use("williamboman/nvim-lsp-installer")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/nvim-cmp")

		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/vim-vsnip")
		use("onsails/lspkind-nvim")

		use({
			"folke/trouble.nvim",
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
		use("nvim-lua/plenary.nvim")
		use("windwp/nvim-autopairs")
		-- use("SmiteshP/nvim-gps")
		use("nvim-telescope/telescope.nvim")
		use("arkav/lualine-lsp-progress")
		use("kyazdani42/nvim-tree.lua")
		use({
			"blackCauldron7/surround.nvim",
			config = function()
				require("surround").setup({ mappings_style = "surround" })
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
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
