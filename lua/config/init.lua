return {
  setup = function(undo_dir)
    require("config.vim").setup(undo_dir)
    require("config.diagnostics")
    require("config.keymaps")
    require("config.external")
  end,
}
