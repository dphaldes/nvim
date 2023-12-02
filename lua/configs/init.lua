return {
  setup = function(undo_dir)
    require("configs.settings").setup(undo_dir)
    require("configs.diagnostics").setup()
    require("configs.keymaps").setup()
    require("configs.external").setup()
  end,
}