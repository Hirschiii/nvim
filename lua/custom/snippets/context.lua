-- require("luasnip.session.snippet_collection").clear_snippets "context"

local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require "luasnip.extras"
local rep = extras.rep

-- A helper function to get only the first word
local function copy_first_word(args)
   local full_text = args[1][1] or ""
   return full_text:match "^([a-zA-Z]+)" or ""
end

ls.add_snippets("context", {
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
})
