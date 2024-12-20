local nvim_web_devicons = "nvim-tree/nvim-web-devicons"
local plenary = "nvim-lua/plenary.nvim"

return {
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
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        group_empty_dirs = true,
      },
      source_selector = {
        winbar = true,
      },
    },
  },
  {
    "m-demare/hlargs.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      progress = {
        display = {
          progress_icon = { pattern = "dots" },
          done_icon = "⠿",
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },
  {
    "luozhiya/lsp-virtual-improved.nvim",
    event = { "LspAttach" },
    config = function()
      require("lsp-virtual-improved").setup()
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        relculright = true,
        segments = {
          {
            sign = { name = { ".*" } },
            click = "v:lua.ScSa",
          },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          {
            sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true },
            click = "v:lua.ScSa",
          },
        },
        ft_ignore = {
          "help",
          "vim",
          "neo-tree",
          "Trouble",
          "lazy",
        },
      }
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      })
    end,
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {},
  },
}
