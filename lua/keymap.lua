local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
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

-- Telescope
keymap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)

-- NerdTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

local options = {
	prefix = "<leader>",
}
local mappings = {
	p = {
		name = "packer",
		s = { "<cmd>PackerSync<CR>", "packer sync" },
		i = { "<cmd>PackerInstall<CR>", "packer install" },
		u = { "<cmd>PackerUpdate<CR>", "packer update" },
		x = { "<cmd>PackerClean<CR>", "packer clean" },
		c = { "<cmd>PackerCompile<CR>", "packer compile" },
		e = { "<cmd>e $MYVIMRC<CR>", "edit config" },
	},
	t = {
		name = "telescope",
		f = { "<cmd>Telescope find_files<CR>", "files" },
		g = { "<cmd>Telescope live_grep<CR>", "live grep" },
		c = { "<cmd>Telescope commands<CR>", "commands" },
		b = { "<cmd>Telescope buffers<CR> ", "buffers" },
	},
	f = {
		name = "file",
		s = { "<cmd>w<CR>", "write" },
		q = { "<cmd>q<CR>", "close" },
		x = { "<cmd>x<CR>", "write-close" },
		c = { "<cmd>qa<CR>", "exit" },
		f = { "<cmd>Telescope find_files<CR>", "find" },
	},
	b = {
		name = "buffer",
		v = { "<cmd>vs<CR>", "vertical" },
		s = { "<cmd>sp<CR>", "horizontal" },
		n = { "<cmd>BufferNext<CR>", "next" },
		p = { "<cmd>BufferPrevious<CR>", "previous" },
		k = { "<cmd>q<CR>", "close" },
		b = { "<cmd>Telescope buffers<CR> ", "buffers" },
	},
	-- Trouble
}
local wk = require("which-key")
wk.setup({
	window = {
		border = "single",
	},
})
wk.register(mappings, options)
