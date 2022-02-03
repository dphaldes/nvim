local signs = {
	{ name = "DiagnosticSignError", text = " " },
	{ name = "DiagnosticSignWarn", text = " " },
	{ name = "DiagnosticSignHint", text = " " },
	{ name = "DiagnosticSignInfo", text = " " },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	-- disable virtual text
	virtual_text = true,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-- Formatter
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		-- builtins.formatting.rustfmt
		-- null_ls.builtins.formatting.dart_format,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})

-- Lualine
require("lualine").setup({
	options = {
		theme = "rose-pine",
		section_separators = { "", "" },
		component_separators = { "", "" },
	},
	sections = {
		lualine_c = {
			-- { gps.get_location, condition = gps.is_available },
		},
	},
	extensions = { "nvim-tree" },
})

-- Autopairs
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

npairs.setup({ map_bs = false })
-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return npairs.esc("<c-y>")
		else
			return npairs.esc("<c-e>") .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end
remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end
remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })

-- Indent Lines
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- -- vim.opt.listchars:append("eol:↴")
-- vim.g.indent_blankline_filetype_exclude = { "trouble", "alpha", "help" }
--
-- require("indent_blankline").setup({
-- 	-- show_end_of_line = true,
-- 	space_char_blankline = " ",
-- })

-- File Tree
vim.g.nvim_tree_respect_buf_cwd = 1

require("nvim-tree").setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

-- require("project_nvim").setup({
-- 	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pubspec.yaml", "init.lua" },
-- })

-- local telescope = require("telescope")
-- telescope.setup({
-- 	pickers = {
-- 		lsp_code_actions = {
-- 			theme = "cursor",
-- 		},
-- 	},
-- })
-- telescope.load_extension("projects")
