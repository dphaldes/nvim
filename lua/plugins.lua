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
		use("kyazdani42/nvim-web-devicons")
		use({ "wbthomason/packer.nvim" })
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			config = function()
				require("configs.treesitter").setup()
			end,
		})
		use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
		use("neovim/nvim-lspconfig")
		use("jose-elias-alvarez/null-ls.nvim")

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

		-- Colorscheme
		use({
			"rose-pine/neovim",
			as = "rose-pine",
			tag = "v1.*",
			config = function()
				require("rose-pine").setup({
					-- dark_variant = "moon",
					disable_italics = true,
				})
				vim.cmd("colorscheme rose-pine")
			end,
		})

		-- UI stuff
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
			after = "rose-pine",
			config = function()
				require("lualine").setup({
					options = {
						theme = "rose-pine",
						section_separators = { "", "" },
						component_separators = { "", "" },
					},
					extensions = { "nvim-tree" },
				})
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			event = "VimEnter",
			config = function()
				require("bufferline").setup()
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = function()
				require("nvim-tree").setup({
					update_cwd = true,
					update_focused_file = {
						enable = true,
						update_cwd = true,
					},
				})
			end,
		})
		use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })
		use({
			"j-hui/fidget.nvim",
			event = "BufRead",
			config = function()
				require("fidget").setup()
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

		-- Editing support
		use("windwp/nvim-autopairs")
		-- FIXME plugin dead
		use({
			"ur4ltz/surround.nvim",
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
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		-- use("lukas-reineke/indent-blankline.nvim")
		use("ahmedkhalf/project.nvim")
		-- use("folke/tokyonight.nvim")
		use({
			"abecodes/tabout.nvim",
			event = "InsertEnter",
			after = "nvim-treesitter",
			config = function()
				require("tabout").setup()
			end,
		})
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
