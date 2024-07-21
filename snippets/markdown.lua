---@diagnostic disable: undefined-global
local date = function()
	return { os.date "%Y-%m-%d" }
end

return {
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
		t { "", "tags:", "- " },
		i(2, ""),
		t { "", "enableToc: true", "publish: false", "---", "" },
		i(0),
	}),
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
}
