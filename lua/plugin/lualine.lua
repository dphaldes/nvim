require("lualine").setup({
	options = {
		-- theme = "rose-pine",
		theme = "duskfox",
		section_separators = { "", "" },
		component_separators = { "", "" },
		global_statusline = true,
	},
	extensions = { "nvim-tree" },
})
vim.o.ch = 0
vim.o.ls = 3
