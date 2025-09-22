local colorbuddy = require("colorbuddy")

local textColor = {}
local attentionColor = {}
local removeColor = {}
local changeColor = {}
local addColor = {}

colorbuddy.colorscheme("zenlima")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles
local hsl = colorbuddy.hsl_to_rgb_string

-- Palette
-- from aomi-greyscale:
-- #e4ece3 hsl(208,  6, 95)
-- #aeb9c2 hsl(207, 10, 76)
-- #78808a hsl(213, 13, 54)
-- #40444a hsl(216, 14, 29)
-- ----
-- #171a1f hsl(218, 26, 12)
-- #0d1117 hsl(216, 43,  9)
--
-- new:
-- #ebdbb2 hsl(43, 24, 92)
-- #b8ab8b hsl(43, 24, 72)
-- #857c64 hsl(43, 24, 52)
--
-- new blue
--
--
--
Color.new("white_01", "#ffeec1")
Color.new("light_yellow_01", "#ebdbb2")
Color.new("light_yellow_02", "#b8ab8b")
Color.new("light_yellow_03", "#857c64")
Color.new("light_yellow_04", "#4f4a3b")

Color.new("light_orange_01", "#de8344")

Color.new("light_red_01", "#de4479")

Color.new("light_green_01", "#60de44")

Color.new("light_blue_01", "#afd7ff")
Color.new("dark_blue_01", "#4a5a6b")
Color.new("dark_blue_02", "#37424f")
Color.new("dark_blue_03", "#2c3640")

Color.new("black", "#000000")

-- Syntax Meta-Groups for further usage below (see :h groups-name)
Group.new("Comment", c.light_blue_01, c.none, s.none)
Group.new("Constant", c.light_yellow_01, c.none, s.none)
Group.new("String", c.light_yellow_02, c.none, s.none)
Group.new("Character", c.light_yellow_02, c.none, s.none)
Group.new("Number", c.light_yellow_02, c.none, s.none)
Group.new("Boolean", c.light_yellow_02, c.none, s.none)
Group.new("Float", c.light_yellow_02, c.none, s.none)
Group.new("Identifier", c.light_yellow_02, c.none, s.none)
Group.new("Function", c.light_yellow_01, c.none, s.bold)
Group.new("Statement", c.light_yellow_02, c.none, s.none)
Group.new("Conditional", c.light_yellow_02, c.none, s.none)
Group.new("Repeat", c.light_yellow_02, c.none, s.none)
Group.new("Label", c.light_yellow_02, c.none, s.none)
Group.new("Operator", c.light_yellow_02, c.none, s.none)
Group.new("Keyword", c.light_yellow_03, c.none, s.none)
Group.new("Exception", c.light_yellow_02, c.none, s.none)
Group.new("PreProc", c.light_yellow_02, c.none, s.none)
Group.new("Include", c.light_yellow_02, c.none, s.none)
Group.new("Define", c.light_yellow_02, c.none, s.none)
Group.new("Macro", c.light_yellow_02, c.none, s.none)
Group.new("PreCondit", c.light_yellow_02, c.none, s.none)
Group.new("Special", c.light_yellow_02, c.none, s.none)
Group.new("SpecialChar", c.light_yellow_01, c.none, s.none)
Group.new("Tag", c.light_yellow_01, c.none, s.none)
Group.new("Delimiter", c.light_yellow_03, c.none, s.none)
Group.new("SpecialComment", c.light_blue_01, c.none, s.none)
Group.new("Debug", c.light_yellow_02, c.none, s.none)
Group.new("Underline", c.light_yellow_02, c.none, s.none)
Group.new("Ignore", c.light_yellow_02, c.none, s.none)
Group.new("Error", c.light_red_01, c.none, s.none)
Group.new("Todo", c.light_blue_01, c.none, s.none)
Group.new("Added", c.light_green_01, c.none, s.none)
Group.new("Changed", c.light_orange_01, c.none, s.none)
Group.new("Removed", c.light_red_01, c.none, s.none)

Group.new("@module", c.light_yellow_02, c.none, s.none)
-- Group.new("@punctuation.bracket", c.light_yellow_03, c.none, s.none)
-- Group.new("@punctuation.delimiter", c.white_01, c.none, s.none)
-- Group.new("@operator", c.light_yellow_03, c.none, s.none)
-- Group.new("@keyword.Function", c.light_yellow_03, c.none, s.none)

-- Syntax Groups as in nvim (:h highlight-groups)
Group.new("ColorColumn", c.light_blue_01, c.none, s.none)
Group.new("Conceal", c.light_blue_01, c.none, s.none)
Group.new("CurSearch", c.light_yellow_02, c.none, s.none)
Group.new("Cursor", c.light_blue_01, c.none, s.none)
Group.new("lCursor", c.light_red_01, c.none, s.none)
Group.new("CursorIM", c.light_yellow_02, c.none, s.none)
Group.new("CursorColumn", nil, c.dark_blue_02, s.none)
Group.new("CursorLine", nil, c.dark_blue_02, s.none)

Group.new("Directory", c.light_yellow_02, c.none, s.none)

Group.new("DiffAdd", c.light_yellow_02, c.none, s.none)
Group.new("DiffChange", c.light_yellow_02, c.none, s.none)
Group.new("DiffDelete", c.light_yellow_02, c.none, s.none)
Group.new("DiffText", c.light_yellow_02, c.none, s.none)

Group.new("EndOfBuffer", c.light_yellow_02, c.none, s.none)
Group.new("TermCursor", c.light_yellow_02, c.none, s.none)
Group.new("TermCursorNC", c.light_yellow_02, c.none, s.none)

Group.new("ErrorMsg", c.light_yellow_02, c.none, s.none)

-- ## Trennlienen zwischen Fenstern
Group.new("WinSeparator", c.light_yellow_03, c.none, s.none)

Group.new("Folded", c.light_yellow_02, c.none, s.none)
Group.new("FoldColumn", c.light_yellow_02, c.none, s.none)
Group.new("SignColumn", c.light_blue_01, c.none, s.none)
Group.new("IncSearch", c.light_yellow_02, c.none, s.none)
Group.new("Substitute", c.light_yellow_02, c.none, s.none)

-- ## Linenumbering
Group.new("LineNr", c.white_01, c.none, s.none)
Group.new("LineNrAbove", c.light_yellow_03, c.none, s.none)
Group.new("LineNrBelow", c.light_yellow_03, c.none, s.none)
Group.new("CursorLineNr", c.white_01, c.none, s.none)
Group.new("CursorLineFold", c.light_yellow_02, c.none, s.none)
Group.new("CursorLineSign", c.light_blue_01, c.none, s.none)

Group.new("MatchParen", c.light_yellow_02, c.none, s.none)
Group.new("ModeMsg", c.light_yellow_02, c.none, s.none)
Group.new("MsgArea", c.light_yellow_02, c.none, s.none)
Group.new("MsgSeparator", c.light_red_01, c.none, s.none)
Group.new("MoreMsg", c.light_yellow_02, c.none, s.none)
Group.new("NonText", c.light_blue_01, c.none, s.none)
Group.new("Normal", c.light_yellow_01, c.none, s.none)
Group.new("NormalFloat", c.light_yellow_02, c.none, s.none)
Group.new("FloatBorder", c.light_yellow_02, c.none, s.none)
Group.new("FloatTitle", c.light_yellow_02, c.none, s.none)
Group.new("FloatFooter", c.light_yellow_02, c.none, s.none)
Group.new("NormalNC", c.light_yellow_02, c.none, s.none)

Group.new("Pmenu", c.light_yellow_02, c.none, s.none)
Group.new("PmenuSel", c.light_yellow_02, c.none, s.none)
Group.new("PmenuKind", c.light_yellow_02, c.none, s.none)
Group.new("PmenuKindSel", c.light_yellow_02, c.none, s.none)
Group.new("PmenuExtra", c.light_yellow_02, c.none, s.none)
Group.new("PmenuExtraSel", c.light_yellow_02, c.none, s.none)
Group.new("PmenuSbar", c.light_yellow_02, c.none, s.none)
Group.new("PmenuThumb", c.light_yellow_02, c.none, s.none)
Group.new("PmenuMatch", c.light_yellow_02, c.none, s.none)
Group.new("PmenuMatchSel", c.light_yellow_02, c.none, s.none)

Group.new("Question", c.light_yellow_02, c.none, s.none)
Group.new("QuckFixLine", c.light_yellow_02, c.none, s.none)
Group.new("Search", c.light_yellow_02, c.none, s.none)
Group.new("SnippetTabstop", c.light_yellow_02, c.none, s.none)
Group.new("SpecialKey", c.light_blue_01, c.none, s.none)

Group.new("SpellBad", c.light_yellow_02, c.none, s.none)
Group.new("SpellCap", c.light_yellow_02, c.none, s.none)
Group.new("SpellLocal", c.light_yellow_02, c.none, s.none)
Group.new("SpellRare", c.light_yellow_02, c.none, s.none)
-- ## StatusLine
Group.new("StatusLine", c.light_yellow_02, c.none, s.none)
Group.new("StatusLineNC", c.light_yellow_02, c.none, s.none)
Group.new("StatusLineTerm", c.light_yellow_02, c.none, s.none)
Group.new("StatusLineTermNC", c.light_yellow_02, c.none, s.none)
--## TabLine
Group.new("TabLine", c.light_red_01, c.none, s.none)
Group.new("TabLineFill", c.light_yellow_02, c.none, s.none)
Group.new("TabLineSel", c.light_yellow_02, c.none, s.none)
Group.new("Title", c.light_yellow_02, c.none, s.none)
Group.new("Visual", c.light_yellow_02, c.none, s.none)
Group.new("VisualNOS", c.light_yellow_02, c.none, s.none)
Group.new("WarningMsg", c.light_yellow_02, c.none, s.none)
Group.new("Whitespace", c.light_yellow_04, c.none, s.none)
Group.new("WildMenu", c.light_yellow_02, c.none, s.none)
Group.new("WinBar", c.light_yellow_02, c.none, s.none)
Group.new("WinBarNC", c.light_yellow_02, c.none, s.none)
-- Group.new("Menu", c.light_yellow_02, c.none, s.none)
-- Group.new("Scrollbar", c.light_yellow_02, c.none, s.none)
-- Group.new("Tooltip", c.light_yellow_02, c.none, s.none)

-- Tested on Elixir
-- Group.new("@function", c.light_yellow_01, nil, s.none)
-- Group.new("@function.bracket", c.light_yellow_03, nil, s.none)
-- Group.new("@keyword", c.light_yellow_02, nil, s.none)
