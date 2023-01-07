return {
  setup = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "json",
        "lua",
        "markdown",
        "python",
        "yaml",
        "cpp",
        "rust"
      },

      highlight = {
        additional_vim_regex_highlighting = false,
        enable = true,
      },
    })
  end,
}
