local nvim_web_devicons = "nvim-tree/nvim-web-devicons"
local plenary = "nvim-lua/plenary.nvim"

return {
  nvim_web_devicons,
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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      nvim_web_devicons,
      plenary,
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
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
}
