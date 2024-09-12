return {
  setup = function(mod)
    local plugin = {
      "nvim-java/nvim-java",
      dependencies = {
        "nvim-java/lua-async-await",
        "nvim-java/nvim-java-core",
        "nvim-java/nvim-java-test",
        "nvim-java/nvim-java-dap",
        "MunifTanjim/nui.nvim",
        "mfussenegger/nvim-dap",
      },
      ft = "java",
      config = function()
        require("java").setup()
        require("lspconfig").jdtls.setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          on_attach = require("util.lsp").setup_on_attach,
        })
      end,
    }
    table.insert(mod, plugin)
  end,
}