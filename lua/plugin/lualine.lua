require("lualine").setup({
	options = {
		theme = "catppuccin",
		section_separators = { "", "" },
		component_separators = { "", "" },
		global_statusline = true,
	},
	extensions = { "nvim-tree" },
})
-- vim.o.ch = 0
vim.o.laststatus = 3
