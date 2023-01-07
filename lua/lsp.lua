local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  keymap(bufnr, "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
  keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]])
end

return {
  setup = function()
    local lspconfig = require("lspconfig")
    local nls = require("null-ls")
    local lsps = {
      "pyright",
      "rust_analyzer",
      "tsserver",
      "sumneko_lua",
      "gdscript",
      "clangd",
      "jdtls",
      "kotlin_language_server",
      "qml_lsp",
      "svelte",
    }
    local server_opts = {
      ["sumneko_lua"] = function(opts)
        opts.settings = {
          Lua = { diagnostics = { globals = { "vim" } } },
        }
      end,
    }

    local on_attach = function(client, buffer)
      lsp_keymaps(buffer)
      if client.name == "sumneko_lua" then
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

    nls.setup({
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black,
        nls.builtins.formatting.rustfmt,
        nls.builtins.formatting.dart_format,
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
