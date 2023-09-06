return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  build = ":TSUpdate",
  dependencies = {
    "neovim/nvim-lspconfig",
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "rose-pine/neovim",
  },
  config = function()
    local rp_colors = require("rose-pine.palette")
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "json",
        "lua",
        "markdown",
        "python",
        "yaml",
        "cpp",
        "rust",
      },

      highlight = {
        additional_vim_regex_highlighting = false,
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
        colors = {
          rp_colors.love,
          rp_colors.gold,
          rp_colors.rose,
          rp_colors.pine,
          rp_colors.foam,
          rp_colors.iris,
        },
      },
      context_commentstring = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
