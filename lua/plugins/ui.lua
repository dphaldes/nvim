local nvim_web_devicons = "nvim-tree/nvim-web-devicons"
local plenary = "nvim-lua/plenary.nvim"

return {
  nvim_web_devicons,
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        no_italic = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          treesitter_context = true,
          ts_rainbow = true,
          semantic_tokens = true,
          nvimtree = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      nvim_web_devicons,
      plenary,
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Neotree toggle" },
    },
    opts = {
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = {
      plenary,
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
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
}
