local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap -- Shorten function name

keymap("", "<Up>", "<Nop>", opts)
keymap("", "<Down>", "<Nop>", opts)
keymap("", "<Left>", "<Nop>", opts)
keymap("", "<Right>", "<Nop>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

--Terminal Mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- local options = {
--   prefix = "<leader>",
-- }
-- local mappings = {
--   c = {
--     name = "config",
--     l = { "<cmd>Lazy<CR>", "Lazy" },
--     m = { "<cmd>Mason<CR>", "Mason" },
--     c = { "<cmd>e $MYVIMRC<CR>", "edit config" },
--   },
--   t = {
--     name = "telescope",
--     f = { "<cmd>Telescope find_files<CR>", "files" },
--     t = { "<cmd>Telescope<CR>", "telescope" },
--   },
--   f = {
--     name = "find",
--     g = { "<cmd>Telescope live_grep<CR>", "live grep" },
--     f = { "<cmd>Telescope find_files<CR>", "find" },
--     e = { "<cmd>NeoTreeFocusToggle<CR>", "explorer" },
--     c = { "<cmd>Telescope commands<CR>", "commands" },
--     b = { "<cmd>Telescope buffers<CR> ", "buffers" },
--     h = { "<cmd>Telescope help_tags<CR>", "help tags" },
--   },
--   o = {
--     name = "open",
--     t = { "<cmd>TroubleToggle<cr>", "trouble" },
--   },
--   -- Trouble
-- }
-- local wk = require("which-key")
-- wk.setup({
--   window = {
--     border = "single",
--   },
-- })
-- wk.register(mappings, options)
