return {
  "nvim-tree/nvim-web-devicons",
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        disable_italics = true,
        dark_variant = "moon",
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "neovim/nvim-lspconfig",
      "p00f/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("treesitter").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = {
            ".git/",
            ".node_modules/",
            ".terraform/",
            ".mypy_cache/",
            "__pycache__/",
            ".cache/",
            ".cpcache/",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local ts = require("telescope")

      ts.setup({
        extensions = {
          file_browser = {
            hijack_netrw = true,
          },
        },
      })
      ts.load_extension("file_browser")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("statusline").setup()
    end,
  },
  {
    "crispgm/nvim-tabline",
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("completion").setup()
    end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "jose-elias-alvarez/null-ls.nvim",
      "onsails/lspkind-nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("lsp").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "m-demare/hlargs.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = {
      text = {
        spinner = "dots",
        done = "⠿",
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = true,
    -- config = function()
    --   require("filetree").setup()
    -- end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    config = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("keymap").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "abecodes/tabout.nvim",
    event = "BufRead",
    setup = true,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufReadPost",
  --   opts = {
  --     char = "▏",
  --     -- char = "│",
  --     filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
  --     show_trailing_blankline_indent = false,
  --     show_current_context = false,
  --   },
  -- },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
  },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.notify = require("notify")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = true,
  },
  { "mfussenegger/nvim-jdtls", ft = { "java" } },
}

--
--
-- 		-- Misc
-- 		use({
-- 			"nvim-neorg/neorg",
-- 			after = "nvim-treesitter",
-- 			run = ":Neorg sync-parsers",
-- 			config = function()
-- 				require("plugin.neorg")
-- 			end,
-- 		})
--
-- 		-- UI
-- 		-- use("mrjones2014/legendary.nvim")
--
-- 		-- Editing support
-- 		use("tpope/vim-surround")
