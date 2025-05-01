return {
   {
      "vimwiki/vimwiki",
      -- The event that triggers the plugin
      event = "BufEnter *.md",
      -- The keys that trigger the plugin
      keys = { "<leader>ww", "<leader>wt" },
      init = function()
         vim.g.vimwiki_list = {
            {
               -- Here will be the path for your wiki
               path = "~/vimwiki/",
               -- The syntax for the wiki
               syntax = "markdown",
               ext = ".md",
            },
            {
               -- Here will be the path for your wiki
               path = "~/knowledge/",
               -- The syntax for the wiki
               syntax = "markdown",
               ext = ".md",
            },
         }
         -- vim.g.vimwiki_ext2syntax = { md = "markdown" }
      end,
   },
   {
      "mfulz/DokuVimNG",
      cond = false,
      config = function()
         require("DokuVimNG").setup {
            urls = {
               "https://wiki.vonhirschfeld.eu",
               -- "https://other.dokuwiki.url",
            },
            creds = {
               { user = "niklas", pass = "0QWlVGW!" },
               -- { user = "user2", pass = "pass2" },
            },
            keepassxc = false,
         }
      end,
   },
}
