return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local left_sep, right_sep = "", ""

    vim.o.laststatus = 3
    require("lualine").setup({
      options = {
        theme = "rose-pine",
        component_separators = " ",
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        section_separators = { left = left_sep, right = right_sep },
        global_statusline = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    })
  end,
}
