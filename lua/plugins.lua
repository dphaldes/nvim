local buf_read = "BufRead"

return {
  "nvim-tree/nvim-web-devicons",
  -- {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha", -- mocha, macchiato, frappe, latte
  --       integrations = {
  --         ts_rainbow = true,
  --         nvimtree = true,
  --         which_key = true,
  --         telescope = true,
  --         treesitter = true,
  --         mason = true,
  --         cmp = true,
  --       },
  --     })
  --     vim.api.nvim_command("colorscheme catppuccin")
  --   end,
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
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
    event = buf_read,
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
    event = buf_read,
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("lsp").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = buf_read,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "p00f/nvim-ts-rainbow",
    event = buf_read,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true,
        },
      })
    end,
  },
  {
    "m-demare/hlargs.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    event = buf_read,
    config = {
      text = {
        spinner = "arc",
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require("filetree").setup()
    end,
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
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
  },
}

-- 		-- use({ "mfussenegger/nvim-jdtls", ft = { "java" } }) -- Java
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
-- 		use({ "stevearc/dressing.nvim" })
-- 		use({ "rcarriga/nvim-notify" })
-- 		-- use("mrjones2014/legendary.nvim")
--
-- 		-- Editing support
-- 		use("tpope/vim-surround")
-- 		use({
-- 			"norcalli/nvim-colorizer.lua",
-- 			event = "BufRead",
-- 			config = function()
-- 				require("colorizer").setup()
-- 			end,
-- 		})
