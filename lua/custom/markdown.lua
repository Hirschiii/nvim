require("render-markdown").setup {
   heading = {
      -- Turn on / off heading icon & background rendering
      enabled = true,
      -- Turn on / off any sign column related rendering
      sign = true,
      -- Determines how the icon fills the available space:
      --  inline: underlying '#'s are concealed resulting in a left aligned icon
      --  overlay: result is left padded with spaces to hide any additional '#'
      position = "overlay",
      -- Replaces '#+' of 'atx_h._marker'
      -- The number of '#' in the heading determines the 'level'
      -- The 'level' is used to index into the array using a cycle
      icons = { "󰲡  ", "󰲣  ", "󰲥  ", "󰲧  ", "󰲩  ", "󰲫  " },
      -- Added to the sign column if enabled
      -- The 'level' is used to index into the array using a cycle
      signs = { "󰫎 " },
      -- Width of the heading background:
      --  block: width of the heading text
      --  full: full width of the window
      width = "full",
      -- The 'level' is used to index into the array using a clamp
      -- Highlight for the heading icon and extends through the entire line
      backgrounds = {
         "RenderMarkdownH1Bg",
         "RenderMarkdownH2Bg",
         "RenderMarkdownH3Bg",
         "RenderMarkdownH4Bg",
         "RenderMarkdownH5Bg",
         "RenderMarkdownH6Bg",
      },
      -- The 'level' is used to index into the array using a clamp
      -- Highlight for the heading and sign icons
      foregrounds = {
         "RenderMarkdownH1",
         "RenderMarkdownH2",
         "RenderMarkdownH3",
         "RenderMarkdownH4",
         "RenderMarkdownH5",
         "RenderMarkdownH6",
      },
   },
}

require("render-markdown").setup {
   code = {
      -- Turn on / off code block & inline code rendering
      enabled = true,
      -- Turn on / off any sign column related rendering
      sign = true,
      -- Determines how code blocks & inline code are rendered:
      --  none: disables all rendering
      --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
      --  language: adds language icon to sign column if enabled and icon + name above code blocks
      --  full: normal + language
      style = "full",
      -- Determines where language icon is rendered:
      --  right: Right side of code block
      --  left: Left side of code block
      position = "left",
      -- An array of language names for which background highlighting will be disabled
      -- Likely because that language has background highlights itself
      disable_background = { "diff" },
      -- Amount of padding to add to the left of code blocks
      left_pad = 0,
      -- Amount of padding to add to the right of code blocks when width is 'block'
      right_pad = 0,
      -- Width of the code block background:
      --  block: width of the code block
      --  full: full width of the window
      width = "full",
      -- Determins how the top / bottom of code block are rendered:
      --  thick: use the same highlight as the code body
      --  thin: when lines are empty overlay the above & below icons
      border = "thin",
      -- Used above code blocks for thin border
      above = "▄",
      -- Used below code blocks for thin border
      below = "▀",
      -- Highlight for code blocks
      highlight = "RenderMarkdownCode",
      -- Highlight for inline code
      highlight_inline = "RenderMarkdownCodeInline",
   },
}

require("render-markdown").setup {
   -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
   -- There are two special states for unchecked & checked defined in the markdown grammar
   checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      unchecked = {
         -- Replaces '[ ]' of 'task_list_marker_unchecked'
         icon = "- 󰄱 ",
         -- Highlight for the unchecked icon
         highlight = "RenderMarkdownUnchecked",
      },
      checked = {
         -- Replaces '[x]' of 'task_list_marker_checked'
         icon = "- 󰱒 ",
         -- Highligh for the checked icon
         highlight = "RenderMarkdownChecked",
      },
      -- Define custom checkbox states, more involved as they are not part of the markdown grammar
      -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
      -- Can specify as many additional states as you like following the 'todo' pattern below
      --   The key in this case 'todo' is for healthcheck and to allow users to change its values
      --   'raw': Matched against the raw text of a 'shortcut_link'
      --   'rendered': Replaces the 'raw' value when rendering
      --   'highlight': Highlight for the 'rendered' icon
      -- custom = {
      --    todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
      -- },
   },
}

require("render-markdown").setup {
   -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'
   -- Can specify as many additional values as you like following the pattern from any below, such as 'note'
   --   The key in this case 'note' is for healthcheck and to allow users to change its values
   --   'raw': Matched against the raw text of a 'shortcut_link', case insensitive
   --   'rendered': Replaces the 'raw' value when rendering
   --   'highlight': Highlight for the 'rendered' text and quote markers
   callout = {
      note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
      tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
      important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
      warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
      caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
      -- Obsidian: https://help.a.md/Editing+and+formatting/Callouts
      abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
      todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
      success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
      question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
      failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
      danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
      bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
      example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
      quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
   },
}
