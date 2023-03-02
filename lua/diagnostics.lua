return {
  setup = function()
    local signs = {
      { name = "DiagnosticSignError", text = " " },
      { name = "DiagnosticSignWarn", text = " " },
      { name = "DiagnosticSignHint", text = " " },
      { name = "DiagnosticSignInfo", text = " " },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "single",
        header = "",
        prefix = "",
      },
    })
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    --   border = "single",
    -- })
    --
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    --   border = "single",
    -- })

    vim.o.updatetime = 250
    -- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
  end,
}
