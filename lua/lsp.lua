-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
		}),
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	keymap(bufnr, "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
	keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-----------------------
--- Setup lspconfig ---
-----------------------
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

--- Custom server options
local server_opts = {
	["sumneko_lua"] = function(opts)
		opts.settings = {
			Lua = { diagnostics = { globals = { "vim" } } },
		}
	end,
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local opts = {
		-- on_attach = function(client)
		-- 	if client.resolved_capabilities.document_formatting then
		-- 		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- 	end
		-- end,
		capabilities = capabilities,
		on_attach = function(_, bufnr)
			lsp_keymaps(bufnr)
		end,
	}

	if server_opts[server.name] then
		server_opts[server.name](opts)
	end

	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

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
