return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        qml = { "qmlformat" },
        -- toml = { "taplo" },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      formatters = {
        qmlformat = {
          command = "qmlformat",
          args = { "-i", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
}
