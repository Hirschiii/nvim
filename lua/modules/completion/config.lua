local config = {}

-- config server in this function
function config.nvim_lsp() end

function config.nvim_cmp()
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

-- Complextras.nvim configuration
vim.api.nvim_set_keymap(
  "i",
  "<C-x><C-m>",
  [[<c-r>=luaeval("require('complextras').complete_matching_line()")<CR>]],
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<C-x><C-d>",
  [[<c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]],
  { noremap = true }
)

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init {
  symbol_map = {
    Copilot = "",
  },
}
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

local cmp = require "cmp"

cmp.setup {
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Return>"] = cmp.mapping.confirm(),
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
          cmp.mapping.complete({ reason = cmp.ContextReason.Auto })
        end
      end,
    },

    -- ["<tab>"] = false,
    ["<tab>"] = cmp.config.disable,
  },

  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "copilot" },
    { name = "eruby" },
  }, {
    { name = "path" },
    { name = "buffer", keyword_length = 4 },
  }, {
    { name = "gh_issues" },
  }),

  sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  -- Youtube: mention that you need a separate snippets plugin
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[issues]",
        tn = "[TabNine]",
        eruby = "[erb]",
      },
    },
  },

  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = false,
  },
}
end

function config.lua_snip()
  local ls = require("luasnip")
  -- some shorthands...
  local snip = ls.snippet
  local node = ls.snippet_node
  local text = ls.text_node
  local insert = ls.insert_node
  local func = ls.function_node
  local choice = ls.choice_node
  local dynamicn = ls.dynamic_node

  require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end
return config
