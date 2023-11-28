local function lsp_keymaps(bufnr)
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  -- keymap("n", "<leader>f", vim.diagnostic.open_float, opts)
  -- keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gK", vim.lsp.buf.signature_help, opts)
  keymap("n", "gd", require("telescope.builtin").lsp_definitions, opts)
  keymap("n", "gi", require("telescope.builtin").lsp_implementations, opts)
  keymap("n", "gr", require("telescope.builtin").lsp_references, opts)
  keymap("n", "gy", require("telescope.builtin").lsp_type_definitions, opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]])
  -- keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- keymap("n", "<leader>cl", vim.lsp.buf.code_action, opts)
  -- keymap("n", "[d", function()
  --   vim.diagnostic.goto_prev({ border = "rounded" })
  -- end, opts)
  -- keymap("n", "gl", function()
  --   vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })
  -- end, opts)
  -- keymap("n", "]d", function()
  --   vim.diagnostic.goto_next({ border = "rounded" })
  -- end, opts)
end

return {
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "simrat39/rust-tools.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      local lspconfig = require("lspconfig")
      local lsps = {
        "ccls",
        "gdscript",
        "jdtls",
        "kotlin_language_server",
        "lua_ls",
        "pylsp",
        "svelte",
        "tsserver",
      }
      local server_opts = {
        ["lua_ls"] = function(opts)
          opts.settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
          }
        end,
        -- ["qmlls"] = function(opts)
        --   opts.filetypes = { "qml", "qmljs" }
        --   opts.cmd = { "qmlls6" }
        -- end,
      }

      local on_attach = function(client, buffer)
        lsp_keymaps(buffer)
        if client.name == "lua_ls" then
          client.server_capabilities.documentFormattingProvider = false
        end

        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint(buffer, true)
        end
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, lsp in pairs(lsps) do
        local opts = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        if server_opts[lsp] then
          server_opts[lsp](opts)
        end
        lspconfig[lsp].setup(opts)
      end

      --- Rust Tools
      local rt = require("rust-tools")
      rt.setup({
        on_attach = on_attach,
      })
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
}