return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  dependencies = {
    "neovim/nvim-lspconfig",
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "m-demare/hlargs.nvim",
  },
  config = function()
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
