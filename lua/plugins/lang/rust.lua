return {
  setup = function(mod)
    local plugin = {
      "simrat39/rust-tools.nvim",
      ft = "rust",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
      opts = function()
        return {
          server = {
            on_attach = require("util.lsp").getLspOnAttach,
          },
        }
      end,
    }
    table.insert(mod, plugin)
  end,
}