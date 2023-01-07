return {
  setup = function()
    local left_sep, right_sep = "", ""

    vim.o.laststatus = 3
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        component_separators = "|",
        section_separators = { left = left_sep, right = right_sep },
        global_statusline = true,
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = left_sep }, right_padding = 2 },
        },
        lualine_b = { "filename", "diagnostics" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "branch", "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = right_sep }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
