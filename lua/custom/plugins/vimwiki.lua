return {
   {
      "vimwiki/vimwiki",
      -- The event that triggers the plugin
      event = "BufEnter *.md",
      cond = true,
      -- The keys that trigger the plugin
      keys = { "<leader>ww", "<leader>wt" },
      init = function()
         vim.g.vimwiki_list = {
            {
               -- Here will be the path for your wiki
               path = "~/wiki/",
               -- The syntax for the wiki
               syntax = "markdown",
               ext = ".md",
            },
            -- {
            --    -- Here will be the path for your wiki
            --    path = "~/knowledge/",
            --    -- The syntax for the wiki
            --    syntax = "markdown",
            --    ext = ".md",
            -- },
         }
         -- vim.g.vimwiki_ext2syntax = { md = "markdown" }
      end,
   },
}
