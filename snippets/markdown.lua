local date = function()
   return { os.date "%Y-%m-%d" }
end
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
local types = require "luasnip.util.types"
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function create_snippet(entry)
   return s(
      { trig = entry, namr = entry:upper() .. " block" },
      fmta(
         [[
             [!<>]
             <>
            ]],
         { i(1, entry:upper()), i(0) }
      )
   )
end

local entries = {
   "note",
   "tip",
   "important",
   "warning",
   "caution",
   "abstract",
   "todo",
   "success",
   "question",
   "failure",
   "danger",
   "bug",
   "example",
   "quote",
}

local callouts = { vim.tbl_map(create_snippet, entries) }

M = {
   s({
      trig = "meta",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown",
   }, {
      t { "---", "title: '" },
      i(1, "note_title"),
      t { "'", "subtitle: '" },
      i(2, "subtitle"),
      t { "'", "author: Niklas von Hirschfeld" },
      t { "", "date: " },
      f(date, {}),
      t { "", "tags:", "- " },
      i(3, ""),
      t { "", "toc: true", "publish: false", "---", "" },
      i(0),
   }),
   s(
      { trig = "beg", name = "begin/end", dscr = "begin/end environment (generic)" },
      fmta(
         [[
    \begin{<>}
    <>
    \end{<>}
    ]],
         { i(1), i(0), rep(1) }
      )
   ),
   s({
      trig = "aligned",
      namr = "Latex Begin Aligned",
      dscr = "The LaTex aligned block",
   }, {
      t { "$$", "\\begin{aligned}", "" },
      i(0, ""),
      t { "", "\\end{aligned}", "$$" },
   }),
   s({
      trig = "pmatrix",
      namr = "Latex Begin Pmatrix",
      dscr = "The LaTex Pmatrix block",
   }, {
      t { "\\begin{pmatrix}", "" },
      i(0, ""),
      t { "", "\\end{pmatrix}" },
   }),
   s({
      trig = "elixir",
      namr = "Codeblock elixir",
   }, {
      t { "```elixir", "" },
      i(0, ""),
      t { "", "```" },
   }),
   s(
      { trig = "frac" },
      fmta(
         [[
	\frac{<>}{<>}<>
	]],
         { i(1), i(2), i(0) }
      )
   ),
}

M = vim.tbl_deep_extend("keep", M, callouts)

return M
