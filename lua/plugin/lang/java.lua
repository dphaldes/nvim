return {
  setup = function(mod)
    local plugin = {
      "mfussenegger/nvim-jdtls",
      dependencies = {
        "williamboman/mason.nvim",
      },
      ft = "java",
      config = function()
        local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
        local config = {
          cmd = { jdtls_bin },
          root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
        }
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          callback = function()
            require("jdtls").start_or_attach(config)
          end,
        })
      end,
    }
    table.insert(mod, plugin)
  end,
}
