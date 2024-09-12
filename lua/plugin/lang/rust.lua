return {
  setup = function(mod)
    local plugin = {
      "mrcjkb/rustaceanvim",
      version = "^4", -- Recommended
      ft = { "rust" },
    }
    table.insert(mod, plugin)
  end,
}
