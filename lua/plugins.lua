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

		-- Colorscheme
		-- use({
		-- 	"rose-pine/neovim",
		-- 	as = "rose-pine",
		-- 	tag = "v1.*",
		-- 	config = function()
		-- 		require("rose-pine").setup({
		-- 			-- dark_variant = "moon",
		-- 			disable_italics = true,
		-- 			highlight_groups = {
		-- 				DiagnosticUnderlineError = { style = "underline" },
		-- 				DiagnosticUnderlineHint = { style = "underline" },
		-- 				DiagnosticUnderlineInfo = { style = "underline" },
		-- 				DiagnosticUnderlineWarn = { style = "underline" },
		-- 			},
		-- 		})
		-- 		vim.cmd("colorscheme rose-pine")
		-- 	end,
		-- })

		use({
			"EdenEast/nightfox.nvim",
			config = function()
				vim.cmd("colorscheme duskfox")
			end,
		})
		-- UI
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
				require("lualine").setup({
					options = {
						-- theme = "rose-pine",
						theme = "duskfox",
						section_separators = { "", "" },
						component_separators = { "", "" },
						global_statusline = true,
					},
					extensions = { "nvim-tree" },
				})
				vim.o.ch = 0
				vim.o.ls = 3
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = function()
				require("nvim-tree").setup({
					update_focused_file = {
						enable = true,
						update_root = true,
					},
				})
			end,
		})
		use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })
		use({
			"j-hui/fidget.nvim",
			event = "BufRead",
			config = function()
				require("fidget").setup({
					text = {
						spinner = "arc",
					},
				})
			end,
		})
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				-- require("alpha").setup(require("alpha.themes.theta").config)
				require("startup")
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
		use({ "simrat39/symbols-outline.nvim" })
		-- use("mrjones2014/legendary.nvim")

		-- Editing support
		use("windwp/nvim-autopairs")
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
		-- use("SmiteshP/nvim-navic")
		-- use({
		-- 	"akinsho/flutter-tools.nvim",
		-- })
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
