local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local max_items = 11

-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 20
local MIN_LABEL_WIDTH = 20

cmp.setup({
	dependencies = {
		cmp_path,
	},
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = {
		{ name = "nvim_lsp", max_item_count = max_items },
		{ name = "luasnip", max_item_count = max_items },
		{ name = "neorg", max_item_count = max_items },
		{ name = "path", max_item_count = max_items },
	},
	window = {
		completion = cmp.config.window.bordered({
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		}),
		documentation = cmp.config.window.bordered({
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		}),
		scrollbar = false,
	},
	-- configure lspkind for vs-code like pictograms in completion menu
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 30,
			ellipsis_char = "...",
		}),
		format2 = function(entry, vim_item)
			vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
			return vim_item
		end,
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer", max_item_count = max_items },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path", max_item_count = max_items },
	}, {
		{ name = "cmdline", max_item_count = max_items },
	}),
})
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_auto = require("cmp")
cmp_auto.event:on("confirm_done", cmp_autopairs.on_confirm_done())
