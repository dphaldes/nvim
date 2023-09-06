local function lsp_keymaps(bufnr)
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  -- keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>f", vim.diagnostic.open_float, opts)
  keymap("n", "[d", function()
    vim.diagnostic.goto_prev({ border = "rounded" })
  end, opts)
  keymap("n", "gl", function()
    vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })
  end, opts)
  keymap("n", "]d", function()
    vim.diagnostic.goto_next({ border = "rounded" })
  end, opts)
  keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]])
end

return {
  setup = function()
    local lspconfig = require("lspconfig")
    local null_ls = require("null-ls")
    local lsps = {
      "pylsp",
      "rust_analyzer",
      "tsserver",
      "lua_ls",
      "gdscript",
      "ccls",
      "kotlin_language_server",
      "svelte",
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

    -- show errors
    vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local lvl = ({ "ERROR", "WARN", "INFO", "DEBUG" })[result.type]
      vim.notify({ result.message }, lvl, {
        title = "LSP | " .. client.name,
        timeout = 10000,
        keep = function()
          return lvl == "ERROR" or lvl == "WARN"
        end,
      })
    end
  end,
}
