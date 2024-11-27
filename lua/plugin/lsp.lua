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
        "astro",
        "clangd",
        "gdscript",
        "lua_ls",
        "qmlls",
        "pylsp",
        "rust_analyzer",
        "tinymist",
        "ts_ls",
        "prolog_ls",
      }
      local server_opts = {
        ["lua_ls"] = function(opts)
          opts.settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
          }
        end,
        ["pylsp"] = function(opts)
          opts.plugins = {
            flake8 = {
              enabled = true,
            },
          }
        end,
        ["qmlls"] = function(opts)
          opts.cmd = { "qmlls6" }
        end,
        ["tinymist"] = function(opts)
          opts.offset_encoding = "utf-8"
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
