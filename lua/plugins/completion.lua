return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "windwp/nvim-autopairs",
      "onsails/lspkind-nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local autopairs = require("nvim-autopairs.completion.cmp")
      local mapping = cmp.mapping
      local luasnip = require("luasnip")
      cmp.event:on("confirm_done", autopairs.on_confirm_done())

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        mapping = mapping.preset.insert({
          ["<C-b>"] = mapping(mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-f>"] = mapping(mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = mapping(mapping.complete(), { "i", "c" }),
          ["<C-e>"] = mapping({
            i = mapping.abort(),
            c = mapping.close(),
          }),
          ["<CR>"] = mapping.confirm({ select = false }),
          ["<Tab>"] = function(fallback)
            -- if cmp.visible() then
            -- 	cmp.select_next_item()
            if luasnip.expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            -- if cmp.visible() then
            -- 	cmp.select_prev_item()
            if luasnip.jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end,
        }),

        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end,
  },
}
