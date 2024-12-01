return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
        opts = {
          enable_autocmd = false,
        },
      },
    },
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "nmac427/guess-indent.nvim",
    event = "VeryLazy",
    config = true,
  },
}
