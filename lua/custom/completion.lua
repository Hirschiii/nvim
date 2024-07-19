require "custom.snippets"

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

-- lcal lspkind_ok, lspkind = pcall(require, "lspkind")
-- lspkind.init {}

local kind_icons = {
	Text = " ",
	Method = "󰆧 ",
	Function = "󰊕 ",
	Constructor = " ",
	Field = "󰇽 ",
	Variable = "󰂡 ",
	Class = "󰠱 ",
	Interface = " ",
	Module = " ",
	Property = "󰜢 ",
	Unit = " ",
	Value = "󰎠 ",
	Enum = " ",
	Keyword = "󰌋 ",
	Snippet = "  ",
	Color = "󰏘 ",
	File = "󰈙 ",
	Reference = " ",
	Folder = "󰉋 ",
	EnumMember = " ",
	Constant = "󰏿 ",
	Struct = " ",
	Event = " ",
	Operator = "󰆕 ",
	TypeParameter = "󰅲 ",
}



local cmp = require "cmp"
local compare = cmp.config.compare

cmp.setup {
	-- sources = {
	--   { name = "nvim_lsp" },
	--   { name = "cody" },
	--   { name = "path" },
	--   { name = "buffer" },
	-- },
	sources = cmp.config.sources({
		-- { name = "nvim_lsp" },
		-- { name = "nvim_lua" },
		-- { name = "luasnip" },
		-- { name = "path" },
		-- { name = "buffer",  keyword_length = 5 }

		{ name = "nvim_lsp",   priority = 8 },
		{ name = "path",       priority = 8 },
		{ name = "luasnip",    priority = 7 },
		{ name = "buffer",     priority = 7 }, -- first for locality sorting?
		{ name = "spell",      keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] },
		{ name = "nvim_lua",   priority = 5 },
		{ name = "fuzzy_path", priority = 4 }, -- from tzacher
		{ name = "calc",       priority = 3 }
	}),
	sorting = {
		priority_weight = 1.0,
		comparators = {
			-- compare.score_offset, -- not good at all
			compare.recently_used,
			compare.locality,
			compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
			compare.offset,
			-- compare.scopes, -- what?
			-- compare.sort_text,
			-- compare.exact,
			compare.kind,
			compare.order,
			-- compare.length, -- useless
		},
	},

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<Return>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = false,
			},
			{ "i", "c" }
		),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{ "i", "c" }
		),
		["<M-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			{ "i", "c" }
		),

		["<c-space>"] = cmp.mapping {
			i = cmp.mapping.complete(),
			c = function(
				_ --[[fallback]]
			)
				if cmp.visible() then
					if not cmp.confirm { select = true } then
						return
					end
				else
					cmp.complete()
				end
			end,
		},

		-- ["<tab>"] = false,
		-- ["<tab>"] = cmp.config.disable,

		-- Cody completion
		-- ["<c-a>"] = cmp.mapping.complete {
		-- 	config = {
		-- 		sources = {
		-- 			{ name = "cody" },
		-- 		},
		-- 	},
		-- },

		-- ["<tab>"] = cmp.mapping {
		--   i = cmp.config.disable,
		--   c = function(fallback)
		--     fallback()
		--   end,
		-- },

		-- Testing
		-- ["<c-q>"] = cmp.mapping.confirm {
		-- 	behavior = cmp.ConfirmBehavior.Replace,
		-- 	select = false,
		-- },

		-- If you want tab completion :'(
		--  First you have to just promise to read `:help ins-completion`.
		--
		-- ["<Tab>"] = function(fallback)
		--   if cmp.visible() then
		--     cmp.select_next_item()
		--   else
		--     fallback()
		--   end
		-- end,
		-- ["<S-Tab>"] = function(fallback)
		--   if cmp.visible() then
		--     cmp.select_prev_item()
		--   else
		--     fallback()
		--   end
		-- end,
	},

	-- Enable luasnip to handle snippet expansion for nvim-cmp
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	view = {
		-- entries = { name = "custom", selection_order = 'near_cursor' }
		entries = { name = "custom" }
	},
	---@diagnostic disable-next-line: missing-fields
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				path = "[Path]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},

	window = {
		-- completion = {
		-- 	border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
		-- 	winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
		-- },
		-- documentation = {
		-- 	border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
		-- 	winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
		-- },
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),

	},

	experimental = {
		ghost_text = {
			hl_group = "CmpGhostText",
		},
	},

}
