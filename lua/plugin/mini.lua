return {
  { "echasnovski/mini.ai", config = true },
  { "echasnovski/mini.surround", config = true },
  {
    "echasnovski/mini.icons",
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
