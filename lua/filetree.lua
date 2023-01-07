return {
  setup = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
        -- update_root = true,
      },
      view = {
        adaptive_size = true,
      },
      renderer = {
        highlight_git = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = false,
            git = false,
          },
        },
      },
    })
  end,
}
