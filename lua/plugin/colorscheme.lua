return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   dependencies = {
  --     "hiphish/rainbow-delimiters.nvim",
  --   },
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha",
  --       no_italic = true,
  --       integrations = {
  --         leap = true,
  --         lsp_trouble = true,
  --         mason = true,
  --         native_lsp = {
  --           enabled = true,
  --           underlines = {
  --             errors = { "undercurl" },
  --             hints = { "undercurl" },
  --             warnings = { "undercurl" },
  --             information = { "undercurl" },
  --           },
  --         },
  --       },
  --     })
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
    config = function()
      require("rose-pine").setup({
        styles = {
          -- bold = true,
          italic = false,
          -- transparency = false,
        },
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
