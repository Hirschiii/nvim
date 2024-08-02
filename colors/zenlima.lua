local colorbuddy = require "colorbuddy"

-- Farben von Highlight

local textColor = { 43, 0.59, 0.81 }
local attentionColor = { 43, 0.59, 0.81 }
local removeColor = { 43, 0.59, 0.81 }
local changeColor = { 43, 0.59, 0.81 }
local addColor = { 43, 0.59, 0.81 }

colorbuddy.colorscheme "zenlima"

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

local util = require "colorbuddy.util"
local hsl = util.hsl_to_rgb_string

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
--
-- new blue
--
--Schnittstelle fuer basis faben
--
-- Hilfe eingenzung eines Wertes zwischen min und max
local function begrenzen(value, min, max)
   if value < min then
      return min
   elseif value > max then
      return max
   else
      return value
   end
end

-- TODO funktion nach oben und unten absichern
-- Max: 95 bei 00
-- Min: 15
--
-- 00: Eine abstufung hoeher
-- 01: Orgiginal Farbe
-- 02: Eine abstufung drunter ...

local function farbAbstufung(name, startFarbe, anzahlAbstufungen, differenz)
   local min = 0.15
   local max = 0.95
   -- print("Start S: " .. startFarbe[3])
   for i = 0, anzahlAbstufungen do
      local H = startFarbe[1]
      local S = startFarbe[2]
      local L = begrenzen(startFarbe[3] - ((i - 1) * differenz), min, max)

      -- print("Rotation: " .. i .. " S: " .. S)

      local formatted_number = string.format("%02d", i)
      Color.new(name .. formatted_number, hsl(H, L, S))
   end
end

farbAbstufung("text_", textColor, 3, 0.2)
farbAbstufung("attention_", attentionColor, 3, 0.2)
farbAbstufung("remove_", removeColor, 3, 0.2)
farbAbstufung("change_", changeColor, 3, 0.2)
farbAbstufung("add_", addColor, 3, 0.2)

-- print(c.text_00:dark():to_hsl())
-- print(c.text_00:dark():dark():to_hsl())

Color.new("white_01", "#ffeec1")
-- Color.new("text_01", hsl(43, 0.24, 0.8))
-- Color.new("text_01", "#ebdbb2")
-- Color.new("text_02", "#b8ab8b")
-- Color.new("text_03", "#857c64")

Color.new("dark_blue_01", "#4a5a6b")
Color.new("dark_blue_02", "#37424f")
Color.new("dark_blue_03", "#2c3640")

Color.new("light_blue_01", "#afd7ff")

Color.new("light_red_01", "#de4479")
Color.new("black", "#000000")

-- Syntax Meta-Groups for further usage below (see :h groups-name)
Group.new("Comment", c.light_blue_01, c.none, s.none)
Group.new("Constant", c.text_01, c.none, s.none)
Group.new("String", c.text_02, c.none, s.none)
Group.new("Character", c.text_02, c.none, s.none)
Group.new("Number", c.text_02, c.none, s.none)
Group.new("Boolean", c.text_02, c.none, s.none)
Group.new("Float", c.text_02, c.none, s.none)
Group.new("Identifier", c.text_02, c.none, s.none)
Group.new("Function", c.text_01, c.none, s.bold)
Group.new("Statement", c.text_02, c.none, s.none)
Group.new("Conditional", c.text_02, c.none, s.none)
Group.new("Repeat", c.text_02, c.none, s.none)
Group.new("Label", c.text_02, c.none, s.none)
Group.new("Operator", c.text_02, c.none, s.none)
Group.new("Keyword", c.text_03, c.none, s.none)
Group.new("Exception", c.text_02, c.none, s.none)
Group.new("PreProc", c.text_02, c.none, s.none)
Group.new("Include", c.text_02, c.none, s.none)
Group.new("Define", c.text_02, c.none, s.none)
Group.new("Macro", c.text_02, c.none, s.none)
Group.new("PreCondit", c.text_02, c.none, s.none)
Group.new("Special", c.text_02, c.none, s.none)
Group.new("SpecialChar", c.text_01, c.none, s.none)
Group.new("Tag", c.text_01, c.none, s.none)
Group.new("Delimiter", c.text_03, c.none, s.none)
Group.new("SpecialComment", c.light_blue_01, c.none, s.none)
Group.new("Debug", c.text_02, c.none, s.none)
Group.new("Underline", c.text_02, c.none, s.none)
Group.new("Ignore", c.text_02, c.none, s.none)
Group.new("Error", c.light_red_01, c.none, s.none)
Group.new("Todo", c.light_blue_01, c.none, s.none)
Group.new("Added", c.light_blue_01, c.none, s.none)
Group.new("Changed", c.light_blue_01, c.none, s.none)
Group.new("Removed", c.light_blue_01, c.none, s.none)

Group.new("@module", c.text_02, c.none, s.none)
-- Group.new("@punctuation.bracket", c.text_03, c.none, s.none)
-- Group.new("@punctuation.delimiter", c.white_01, c.none, s.none)
-- Group.new("@operator", c.text_03, c.none, s.none)
-- Group.new("@keyword.Function", c.text_03, c.none, s.none)

-- Syntax Groups as in nvim (:h highlight-groups)
Group.new("ColorColumn", c.light_red_01, c.none, s.none)
Group.new("Conceal", c.light_red_01, c.none, s.none)
Group.new("CurSearch", c.text_02, c.none, s.none)
Group.new("Cursor", c.text_02, c.none, s.none)
Group.new("lCursor", c.text_02, c.none, s.none)
Group.new("CursorIM", c.text_02, c.none, s.none)
Group.new("CursorColumn", nil, c.dark_blue_02, s.none)
Group.new("CursorLine", nil, c.dark_blue_02, s.none)

Group.new("Directory", c.text_02, c.none, s.none)

Group.new("DiffAdd", c.text_02, c.none, s.none)
Group.new("DiffChange", c.text_02, c.none, s.none)
Group.new("DiffDelete", c.text_02, c.none, s.none)
Group.new("DiffText", c.text_02, c.none, s.none)

Group.new("EndOfBuffer", c.text_02, c.none, s.none)
Group.new("TermCursor", c.text_02, c.none, s.none)
Group.new("TermCursorNC", c.text_02, c.none, s.none)

Group.new("ErrorMsg", c.text_02, c.none, s.none)

-- ## Trennlienen zwischen Fenstern
Group.new("WinSeparator", c.text_03, c.none, s.none)

Group.new("Folded", c.text_02, c.none, s.none)
Group.new("FoldColumn", c.text_02, c.none, s.none)
Group.new("SignColumn", c.light_red_01, c.none, s.none)
Group.new("IncSearch", c.text_02, c.none, s.none)
Group.new("Substitute", c.text_02, c.none, s.none)

-- ## Linenumbering
Group.new("LineNr", c.white_01, c.none, s.none)
Group.new("LineNrAbove", c.text_03, c.none, s.none)
Group.new("LineNrBelow", c.text_03, c.none, s.none)
Group.new("CursorLineNr", c.white_01, c.none, s.none)
Group.new("CursorLineFold", c.text_02, c.none, s.none)
Group.new("CursorLineSign", c.light_red_01, c.none, s.none)

Group.new("MatchParen", c.text_02, c.none, s.none)
Group.new("ModeMsg", c.text_02, c.none, s.none)
Group.new("MsgArea", c.text_02, c.none, s.none)
Group.new("MsgSeparator", c.light_red_01, c.none, s.none)
Group.new("MoreMsg", c.text_02, c.none, s.none)
Group.new("NonText", c.light_red_01, c.none, s.none)
Group.new("Normal", c.text_01, c.none, s.none)
Group.new("NormalFloat", c.text_02, c.none, s.none)
Group.new("FloatBorder", c.text_02, c.none, s.none)
Group.new("FloatTitle", c.text_02, c.none, s.none)
Group.new("FloatFooter", c.text_02, c.none, s.none)
Group.new("NormalNC", c.text_02, c.none, s.none)

Group.new("Pmenu", c.text_02, c.none, s.none)
Group.new("PmenuSel", c.text_02, c.none, s.none)
Group.new("PmenuKind", c.text_02, c.none, s.none)
Group.new("PmenuKindSel", c.text_02, c.none, s.none)
Group.new("PmenuExtra", c.text_02, c.none, s.none)
Group.new("PmenuExtraSel", c.text_02, c.none, s.none)
Group.new("PmenuSbar", c.text_02, c.none, s.none)
Group.new("PmenuThumb", c.text_02, c.none, s.none)
Group.new("PmenuMatch", c.text_02, c.none, s.none)
Group.new("PmenuMatchSel", c.text_02, c.none, s.none)

Group.new("Question", c.text_02, c.none, s.none)
Group.new("QuckFixLine", c.text_02, c.none, s.none)
Group.new("Search", c.text_02, c.none, s.none)
Group.new("SnippetTabstop", c.text_02, c.none, s.none)
Group.new("SpecialKey", c.light_red_01, c.none, s.none)

Group.new("SpellBad", c.text_02, c.none, s.none)
Group.new("SpellCap", c.text_02, c.none, s.none)
Group.new("SpellLocal", c.text_02, c.none, s.none)
Group.new("SpellRare", c.text_02, c.none, s.none)
-- ## StatusLine
Group.new("StatusLine", c.text_02, c.none, s.none)
Group.new("StatusLineNC", c.text_02, c.none, s.none)
Group.new("StatusLineTerm", c.text_02, c.none, s.none)
Group.new("StatusLineTermNC", c.text_02, c.none, s.none)
--## TabLine
Group.new("TabLine", c.light_red_01, c.none, s.none)
Group.new("TabLineFill", c.text_02, c.none, s.none)
Group.new("TabLineSel", c.text_02, c.none, s.none)
Group.new("Title", c.text_02, c.none, s.none)
Group.new("Visual", c.text_02, c.none, s.none)
Group.new("VisualNOS", c.text_02, c.none, s.none)
Group.new("WarningMsg", c.text_02, c.none, s.none)
Group.new("Whitespace", c.light_red_01, c.none, s.none)
Group.new("WildMenu", c.text_02, c.none, s.none)
Group.new("WinBar", c.text_02, c.none, s.none)
Group.new("WinBarNC", c.text_02, c.none, s.none)
-- Group.new("Menu", c.text_02, c.none, s.none)
-- Group.new("Scrollbar", c.text_02, c.none, s.none)
-- Group.new("Tooltip", c.text_02, c.none, s.none)

-- Tested on Elixir
-- Group.new("@function", c.text_01, nil, s.none)
-- Group.new("@function.bracket", c.text_03, nil, s.none)
-- Group.new("@keyword", c.text_02, nil, s.none)
