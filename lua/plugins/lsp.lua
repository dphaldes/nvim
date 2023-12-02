return {
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      local lspconfig = require("lspconfig")
      local lsps = {
        "ccls",
        "gdscript",
        "kotlin_language_server",
        "lua_ls",
        "pylsp",
        "svelte",
        "tsserver",
        "qmlls",
      }
      local server_opts = {
        ["lua_ls"] = function(opts)
          opts.settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
          }
        end,
        ["ccls"] = function(opts)
          opts.offset_encoding = "utf-16"
        end,
        ["qmlls"] = function(opts)
          opts.cmd = { "qmlls6" }
        end,
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, lsp in pairs(lsps) do
        local opts = {
          capabilities = capabilities,
          on_attach = require("util.lsp").getLspOnAttach,
        }
        if server_opts[lsp] then
          server_opts[lsp](opts)
        end
        lspconfig[lsp].setup(opts)
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "BufRead",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.dart_format,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.qmlformat,
          null_ls.builtins.diagnostics.qmllint,
        },
        on_attach = function(client)
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
          end
        end,
      })
    end,
  },
  { "folke/neodev.nvim", opts = {} },
}