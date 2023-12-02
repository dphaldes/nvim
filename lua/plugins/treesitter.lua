return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  dependencies = {
    "neovim/nvim-lspconfig",
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
      indent = {
        enable = true,
      },
    })
  end,
}