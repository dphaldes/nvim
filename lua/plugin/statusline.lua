return {
  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    config = function()
      vim.o.laststatus = 3
      require("lualine").setup({
        options = {
          theme = "rose-pine",
          component_separators = " ",
          -- component_separators = { left = "", right = "" },
          -- section_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          global_statusline = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { right = 0, left = 1 } },
            { "filename", path = 1, padding = { left = 0 }, symbols = {
              unnamed = "",
            } },
          },
          lualine_x = { "diagnostics" },
          lualine_y = { "diff" },
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
        extensions = { "neo-tree", "lazy" },
      })
    end,
  },
  {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local theme = {
        fill = "TabLineFill",
        head = "TabLine",
        current_tab = "TabLineSel",
        tab = "TabLine",
        win = "TabLine",
        tail = "TabLine",
      }
      require("tabby.tabline").set(function(line)
        return {
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              string.format(" %d: ", tab.number()),
              string.format("%s ", tab.current_win().buf_name()),
              tab.current_win().buf().is_changed() and " [+]" or "",
              hl = hl,
            }
          end),
          line.spacer(),
          hl = theme.fill,
        }
      end)
    end,
  },
}
