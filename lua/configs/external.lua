local M = {
  setup = function()
    if vim.g.neovide then
      vim.o.guifont = "Maple Mono:h9"
      vim.g.neovide_scroll_animation_length = 0
      vim.g.neovide_cursor_animation_length = 0

      vim.g.neovide_cursor_trail_size = 0
    end
  end,
}

return M