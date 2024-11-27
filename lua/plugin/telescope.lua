return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope find_files" },
      { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live_grep" },
      { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
      { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Telescope help_tags" },
    },
    opts = {
      defaults = vim.tbl_extend("force", require("telescope.themes").get_ivy(), {
        -- path_display = function(_, path)
        --   local tail = require("telescope.utils").path_tail(path)
        --   return string.format("%s %s", tail, path)
        -- end,
        -- path_display = { truncate = 3 },
        path_display = { "smart" },
      }),
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = {
            "_build/",
            ".cache/",
            ".cpcache/",
            ".git/",
            ".mypy_cache/",
            ".node_modules/",
            "__pycache__/",
            "target/classes/",
            ".terraform/",
          },
        },
      },
    },
  },
}
