local date = function()
  return { os.date "%Y-%m-%d" }
end

return {
  s("ctrig", t "also loaded!!"),
  s({
    trig = "meta",
    namr = "Metadata",
    dscr = "Yaml metadata format for markdown",
  }, {
    t { "---", "title: '" },
    i(1, "note_title"),
    t { "'", "author: Niklas von Hirschfeld" },
    t { "", "date: " },
    f(date, {}),
    t { "", "tags: [" },
    i(2),
    t { "]", "enableToc: true", "---", "" },
    i(0),
  }),
}
