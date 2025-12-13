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

ls.add_snippets("java", {
   s({
      trig = "kit_doc",
   }, {
      t { "/**", "*" },
      i(1, " Name des Prgramms, ggf Aufgabe"),
      t { ".", "*", "* @author ubnlr", "*", "*/" },
   }),
})
