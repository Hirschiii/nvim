-- require("luasnip.session.snippet_collection").clear_snippets "context"

local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local extras = require "luasnip.extras"
local rep = extras.rep

ls.add_snippets("vimwiki", {
   s({
      trig = "template",
      namr = "Start and Stop",
   }, {
      c(1, {
         t " # Notes\n\n\n# ToDo\n\n\n# Revision\n\n\n",
         t "# ToDO",
         t "# Rueckblick",
      }, {}),
   }),
})
