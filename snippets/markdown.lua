local date = function() return { os.date('%Y-%m-%d') } end

	-- s = function() return require("luasnip.nodes.snippet").S end,
	-- sn = function() return require("luasnip.nodes.snippet").SN end,
	-- isn = function() return require("luasnip.nodes.snippet").ISN end,
	-- t = function() return require("luasnip.nodes.textNode").T end,
	-- i = function() return require("luasnip.nodes.insertNode").I end,
	-- f = function() return require("luasnip.nodes.functionNode").F end,
	-- c = function() return require("luasnip.nodes.choiceNode").C end,
	-- d = function() return require("luasnip.nodes.dynamicNode").D end,
	-- r = function() return require("luasnip.nodes.restoreNode").R end,
	-- events = function() return require("luasnip.util.events") end,
	-- ai = function() return require("luasnip.nodes.absolute_indexer") end,
	-- extras = function() return require("luasnip.extras") end,
	-- l = function() return require("luasnip.extras").lambda end,
	-- rep = function() return require("luasnip.extras").rep end,
	-- p = function() return require("luasnip.extras").partial end,
	-- m = function() return require("luasnip.extras").match end,
	-- n = function() return require("luasnip.extras").nonempty end,
	-- dl = function() return require("luasnip.extras").dynamic_lambda end,
	-- fmt = function() return require("luasnip.extras.fmt").fmt end,
	-- fmta = function() return require("luasnip.extras.fmt").fmta end,
	-- conds = function() return require("luasnip.extras.expand_conditions") end,
	-- postfix = function() return require("luasnip.extras.postfix").postfix end,
	-- types = function() return require("luasnip.util.types") end,
	-- parse = function() return require("luasnip.util.parser").parse_snippet end,
	-- ms = function() return require("luasnip.nodes.multiSnippet").new_multisnippet end,

return {
  s("ctrig", t("also loaded!!")),
  s({
      trig = "meta",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown"
    },
    {
      t({ "---",
        "title: '" }), i(1, "note_title"), t({ "'",
      "author: Niklas von Hirschfeld" }), t({ "",
      "date: " }), f(date, {}), t({ "",
      "tags: [" }), i(2), t({ "]",
      "enableToc: true",
      "---", "" }),
      i(0)
    })
}, {
  s("autotrig", t("autotriggered, if enabled")),
}
