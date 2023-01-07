-- require("plugins")
-- require("settings")
-- require("lsp")
-- require("diagnostics")
-- require("config")
-- require("keymap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local undo_dir = vim.loop.os_homedir() .. "/.vim/undodir"

if not vim.loop.fs_stat(lazypath) then
  print("nvim is bootstrapping.")

  local fn = vim.fn
  if not fn.isdirectory(undo_dir) then
    fn.mkdir(undo_dir, "", 0700)
  end

  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

--vim.filetype.add({
--  extension = {
--    edn = "clojure",
--    tfvars = "hcl",
--  },
--})

require("settings").setup(undo_dir)
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "logipat",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "rrhelper",
        "spec",
        "tar",
        "tarPlugin",
        "vimball",
        "vimballPlugin",
      },
    },
  },
})
