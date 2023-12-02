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

local M = {}

function M.getLspOnAttach(client, buffer)
  lsp_keymaps(buffer)
  if client.name == "lua_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(buffer, true)
  end
end

return M