return {
  setup = function(undo_dir)
    local encoding = "utf-8"
    local opts = {
      autoindent = true,
      background = "dark",
      backup = false,
      cmdheight = 1,
      completeopt = "menuone,noselect",
      cursorline = true,
      encoding = encoding,
      errorbells = false,
      expandtab = true,
      fileencoding = encoding,
      fileformats = "unix,dos,mac",
      foldcolumn = "1",
      hidden = true,
      history = 1000,
      hlsearch = false,
      ignorecase = true,
      incsearch = true,
      laststatus = 3,
      lazyredraw = true,
      magic = true,
      mat = 2,
      number = true,
      relativenumber = true,
      ruler = false,
      scrolloff = 7,
      shiftwidth = 2,
      shortmess = vim.o.shortmess .. "W",
      showmatch = true,
      showmode = false,
      smartindent = true,
      smarttab = true,
      swapfile = false,
      tabstop = 2,
      termguicolors = true,
      timeoutlen = 500,
      undodir = undo_dir,
      undofile = true,
      updatetime = 100,
      visualbell = false,
      wrap = false,
      writebackup = false,
      splitright = true,
      splitbelow = true,
      pumheight = 10,
    }

    for opt, val in pairs(opts) do
      vim.o[opt] = val
    end

    local leader = " "
    vim.g.mapleader = leader
    vim.g.maplocalleader = leader
  end,
}
