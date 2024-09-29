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

-- local function create_snippet(entry)
--    return s({
--       trig = entry,
--       namr = entry .. " Block",
--    }, {
--       t { "::: " .. entry, "" },
--       i(1, ""),
--       t { "", ":::", "" },
--       i(0, ""),
--    })
-- end
--
-- local entries = {
--    "example",
--    "alert",
--    "block",
--    "leftbar",
--    "inmargin",
-- }
--
-- local callouts = { vim.tbl_map(create_snippet, entries) }

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
      t {
         "",
         "toc: true",
         "bib: false",
         "chapter: false",
         "publish: false",
         "titlepage: default",
         "environments: []",
         "---",
         "",
      },
      i(0),
   }),
   s({
      trig = "meta.poster",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown",
   }, {
      t { "---", "title: '" },
      i(1, "note_title"),
      t { "'", "institute: '" },
      i(2, "Gymnasium Lüneburger Heide"),
      t { "'", "author: Niklas von Hirschfeld" },
      t { "", "date: " },
      f(date, {}),
      t { "", "toc: true", "publish: false", "titlepage: default", "---", "" },
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
      t { "$$", "\\startaligne", "" },
      i(0, ""),
      t { "", "\\stopaligne", "$$" },
   }),
   s({
      trig = "pmatrix",
      namr = "Latex Begin Pmatrix",
      dscr = "The LaTex Pmatrix block",
   }, {
      t { "\\startpmatrix", "" },
      i(0, ""),
      t { "", "\\stoppmatrix" },
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
   s({
      trig = "example",
      namr = "example Block",
   }, {
      t { "::: " .. "example", "" },
      i(1, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "alert",
      namr = "alert Block",
   }, {
      t { "::: " .. "alert", "" },
      i(1, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "leftbar",
      namr = "leftbar Block",
   }, {
      t { "::: " .. "leftbar", "" },
      i(1, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "block",
      namr = "block Block",
   }, {
      t { "::: " .. "block", "" },
      i(1, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "inmargin",
      namr = "inmargin Block",
   }, {
      t { "::: " .. "inmargin", "" },
      i(1, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "div",
      namr = "block Block",
   }, {
      t { "::: " },
      i(1, "name"),
      t { "", "" },
      i(2, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "math",
      namr = "block Block",
   }, {
      t { '::: {.math title="' },
      i(1),
      t { '" reference="' },
      i(2),
      t { '" }' },
      t { "", "" },
      i(3, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "buffer",
      namr = "block Block",
   }, {
      t { '::: {.buffer title="' },
      i(1),
      t { '" reference="' },
      i(2),
      t { '" }' },
      t { "", "" },
      i(3, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
   s({
      trig = "definition",
      namr = "block Block",
   }, {
      t { '::: {.definition title="' },
      i(1, ""),
      t { '"}', "" },
      i(2, ""),
      t { "", ":::", "" },
      i(0, ""),
   }),
}

-- M = vim.tbl_deep_extend("keep", M, callouts)

return M
