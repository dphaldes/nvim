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
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find_files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live_grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    },
    opts = {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
      },
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
