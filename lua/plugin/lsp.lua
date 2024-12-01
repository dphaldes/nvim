return {
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsps = {
        "astro",
        "clangd",
        "gdscript",
        "lua_ls",
        "millet",
        "pylsp",
        "prolog_ls",
        "rust_analyzer",
        "tinymist",
        "ts_ls",
        "qmlls",
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
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
