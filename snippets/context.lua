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

-- local function copy(args)
--    return args[1]
-- end
--

-- A helper function to get only the first word
local function copy_first_word(args)
   local full_text = args[1][1] or ""
   return full_text:match "^([a-zA-Z]+)" or ""
end

M = {
   s({
      trig = "start",
      namr = "Start and Stop",
   }, {
      t { "\\start" },
      i(1, ""),
      t { "", "" },
      i(0),
      t { "", "\\stop" },
      -- f(copy, 1), -- Does the same
      -- rep(1), -- does the same
      f(copy_first_word, 1),
   }),
   s({
      trig = "mpbuffer",
   }, {
      t { "\\startbuffer[" },
      i(1, "reference"),
      t {
         "]",
         "\\startMPpage",
         "",
         "u := 1cm;",
      },
      i(0, ""),
      t {
         "",
         "\\stopMPpage",
         "\\stopbuffer",
         "",
         "\\placefigure[force][",
      },
      rep(1),
      t {
         "]{",
      },
      i(2, "Name"),
      t { "}{", "\\typesetbuffer[" },
      rep(1),
      t { "]", "}" },
   }),
   s({
      trig = "list",
   }, {
      t { "\\startitemize[packed" },
      i(1, ""),
      t { "]", "\\item " },
      i(2, ""),
      t { "", "\\stopitemize" },
   }),
   s({
      trig = "table",
   }, {
      t { "\\startplacetable[location={here},title={" },
      i(1, ""),
      t { "}]" },
      t { "", "\\bTABLE", "" },
      i(2, ""),
      t { "", "\\eTABLE", "\\stopplacetable" },
   }),
   s({
      trig = "placeformula",
   }, {
      t { "\\startplaceformula[" },
      i(1, "reference"),
      t { "]", "" },
      t { "\\startformula", "" },
      i(2, ""),
      t { "", "\\stopformula", "" },
      t { "\\stopplaceformula" },
   }),
   s({
      trig = "tipp",
      namr = "Start and Stop",
   }, {
      t { "\\startframedtipp" },
      t { "", "" },
      i(1),
      t { "", "\\stopframedtipp", "" },
      i(0),
      -- f(copy, 1), -- Does the same
   }),
   s({
      trig = "warning",
      namr = "Start and Stop",
   }, {
      t { "\\startframedwarning" },
      t { "", "" },
      i(1),
      t { "", "\\stopframedwarning", "" },
      i(0),
      -- f(copy, 1), -- Does the same
   }),
   s({
      trig = "example",
      namr = "Start and Stop",
   }, {
      t { "\\startframedexample" },
      t { "", "" },
      i(1),
      t { "", "\\stopframedexample", "" },
      i(0),
      -- f(copy, 1), -- Does the same
   }),
   s({
      trig = "task",
      namr = "Start and Stop",
   }, {
      t { "\\startframedtask" },
      t { "", "" },
      i(1),
      t { "", "\\stopframedtask", "" },
      i(0),
      -- f(copy, 1), -- Does the same
   }),
   s({
      trig = "definition",
      namr = "Start and Stop",
   }, {
      t { "\\startframeddefinition[title={" },
      i(1, "Titel"),
      t { "}]", "" },
      i(2),
      t { "", "\\stopframeddefinition", "" },
      i(0),
      -- f(copy, 1), -- Does the same
   }),
   s({
      trig = "sidenote",
   }, {
      t { "{\\sidenote{" },
      i(1, ""),
      t { "}" },
      i(0),
   }),

   s({
      trig = "bf",
   }, {
      t { "{\\bf " },
      i(1, ""),
      t { "}" },
   }),
}

-- M = vim.tbl_deep_extend("keep", M, callouts)

return M
