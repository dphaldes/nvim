return {
  setup = function(mod)
    local plugin = {
      "mrcjkb/rustaceanvim",
      version = "^4", -- Recommended
      ft = { "rust" },
      config = function()
        vim.g.rustaceanvim = {
          server = {
            on_attach = require("util.lsp").setup_on_attach,
          },
        }
      end,
    }
    table.insert(mod, plugin)
  end,
}