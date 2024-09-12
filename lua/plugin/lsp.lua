return {
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
            "file:/home/chonky/.config/nvim/mason",
          },
        },
      },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      local lspconfig = require("lspconfig")
      local lsps = {
        "clangd",
        "gdscript",
        "lua_ls",
        "qmlls",
        "rust_analyzer",
      }
      local server_opts = {
        ["lua_ls"] = function(opts)
          opts.settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
          }
        end,
        ["qmlls"] = function(opts)
          opts.cmd = { "qmlls6" }
        end,
      }

      for _, lsp in pairs(lsps) do
        local opts = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
        if server_opts[lsp] then
          server_opts[lsp](opts)
        end
        lspconfig[lsp].setup(opts)
      end
    end,
  },
  { "folke/neodev.nvim", config = true },
}
