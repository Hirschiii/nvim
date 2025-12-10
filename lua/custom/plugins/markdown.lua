return {
   {
      "MeanderingProgrammer/render-markdown.nvim",
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {
         link = {
            -- Turn on / off inline link icon rendering.
            enabled = true,
            -- Additional modes to render links.
            render_modes = false,
            -- How to handle footnote links, start with a '^'.
            footnote = {
               -- Turn on / off footnote rendering.
               enabled = true,
               -- Replace value with superscript equivalent.
               superscript = true,
               -- Added before link content.
               prefix = "",
               -- Added after link content.
               suffix = "",
            },
            -- Inlined with 'image' elements.
            image = "󰥶 ",
            -- Inlined with 'email_autolink' elements.
            email = "󰀓 ",
            -- Fallback icon for 'inline_link' and 'uri_autolink' elements.
            hyperlink = "󰌹 ",
            -- Applies to the inlined icon as a fallback.
            highlight = "RenderMarkdownLink",
            -- Applies to WikiLink elements.
            wiki = {
               icon = "󱗖 ",
               body = function()
                  return nil
               end,
               highlight = "RenderMarkdownWikiLink",
               scope_highlight = nil,
            },
            -- Define custom destination patterns so icons can quickly inform you of what a link
            -- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
            -- patterns match a link the one with the longer pattern is used.
            -- The key is for healthcheck and to allow users to change its values, value type below.
            -- | pattern   | matched against the destination text                            |
            -- | icon      | gets inlined before the link text                               |
            -- | kind      | optional determines how pattern is checked                      |
            -- |           | pattern | @see :h lua-patterns, is the default if not set       |
            -- |           | suffix  | @see :h vim.endswith()                                |
            -- | priority  | optional used when multiple match, uses pattern length if empty |
            -- | highlight | optional highlight for 'icon', uses fallback highlight if empty |
            custom = {
               web = { pattern = "^http", icon = "󰖟 " },
               discord = { pattern = "discord%.com", icon = "󰙯 " },
               github = { pattern = "github%.com", icon = "󰊤 " },
               gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
               google = { pattern = "google%.com", icon = "󰊭 " },
               neovim = { pattern = "neovim%.io", icon = " " },
               reddit = { pattern = "reddit%.com", icon = "󰑍 " },
               stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
               wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
               youtube = { pattern = "youtube%.com", icon = "󰗃 " },
            },
         },
      },
   },

   -- install with yarn or npm
   {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && npm install",
      init = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
   },
   {
      "DAmesberger/sc-im.nvim",
      ft = { "markdown" },
      config = function()
         require("sc-im").setup {
            ft = "scim",
            include_sc_file = true,
            update_sc_from_md = true,
            link_fmt = 1,
            split = "floating",
			highlight = {
				enabled = true,
			},
            float_config = {
               height = 0.9,
               width = 0.9,
               style = "minimal",
               border = "single",
               hl = "Normal",
               blend = 0,
            },
         }

         -- Keybindings
         vim.api.nvim_set_keymap(
            "n",
            "<leader>sc",
            ":lua require'sc-im'.open_in_scim()<CR>",
            { noremap = true, silent = true }
         )
         vim.api.nvim_set_keymap(
            "t",
            "<leader>x",
            [[<C-\><C-n>:lua require('sc-im').close()<CR>]],
            { noremap = true, silent = true }
         )
      end,
   },
}
