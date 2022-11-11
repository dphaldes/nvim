-- VimBeGood
-- Hydra
-- git
-- leap

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup({
	function(use)
		-- Must-installs and dependencies
		use("nvim-lua/plenary.nvim")
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "wbthomason/packer.nvim" })
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("treesitter").setup()
			end,
		})
		use("p00f/nvim-ts-rainbow")
		use({
			"m-demare/hlargs.nvim",
			config = function()
				require("hlargs").setup()
			end,
		})
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		})
		use("neovim/nvim-lspconfig")
		use("jose-elias-alvarez/null-ls.nvim")
		use("lewis6991/impatient.nvim")
		use("nathom/filetype.nvim")
		-- use({ "mfussenegger/nvim-jdtls", ft = { "java" } }) -- Java

		-- Completion
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/nvim-cmp")

		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use("onsails/lspkind-nvim")

		use({
			"catppuccin/nvim",
			as = "catppuccin",
			config = function()
				require("catppuccin").setup({
					flavour = "mocha", -- mocha, macchiato, frappe, latte
					integrations = {
						ts_rainbow = true,
					},
				})
				vim.api.nvim_command("colorscheme catppuccin")
			end,
		})

		-- Misc
		use({
			"nvim-neorg/neorg",
			after = "nvim-treesitter",
			run = ":Neorg sync-parsers",
			config = function()
				require("plugin.neorg")
			end,
		})

		-- UI
		use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })
		use({
			"folke/trouble.nvim",
			cmd = { "Trouble", "TroubleToggle" },
			config = function()
				require("trouble").setup()
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			enter = "VimEnter",
			-- after = "rose-pine",
			config = function()
				require("plugin.lualine")
			end,
		})
		use({
			"nvim-tree/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = function()
				require("plugin.nvim-tree")
			end,
		})
		use({
			"j-hui/fidget.nvim",
			event = "BufRead",
			config = function()
				require("plugin.fidget")
			end,
		})
		use({
			"lewis6991/gitsigns.nvim", -- Add keybinds later
			event = "BufRead",
			config = function()
				require("gitsigns").setup()
			end,
		})
		use({ "stevearc/dressing.nvim" })
		use({ "rcarriga/nvim-notify" })
		use("folke/which-key.nvim")
		-- use("mrjones2014/legendary.nvim")

		-- Editing support
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("plugin.autopairs")
			end,
		})
		use("tpope/vim-surround")
		use({
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = function()
				require("colorizer").setup()
			end,
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use("ahmedkhalf/project.nvim")
		use({
			"abecodes/tabout.nvim",
			config = function()
				require("tabout").setup()
			end,
		})
		use({ "gpanders/editorconfig.nvim" })
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	-- config = {
	-- 	display = {
	-- 		open_fn = function()
	-- 			return require("packer.util").float({ border = "single" })
	-- 		end,
	-- 	},
	-- },
})
