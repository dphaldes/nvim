require("autocommand.lsp_attach")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight yanked region temporarily",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "clean up trailing whitespace before saving",
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    -- See: https://github.com/cappyzawa/trim.nvim/blob/master/lua/trim/config.lua
    local patterns = {
      [[%s/\s\+$//e]],
      [[%s/\($\n\s*\)\+\%$//]],
      [[%s/\%^\n\+//]],
    }

    for _, pattern in pairs(patterns) do
      vim.api.nvim_exec(string.format("silent! %s", pattern), false)
    end

    vim.fn.winrestview(save)
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "don't auto commenting new lines",
  pattern = "*",
  command = [[set fo-=c fo-=r fo-=o ]],
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  desc = "set filetype for qml",
  pattern = "*.qml",
  command = "set ft=qml",
})
