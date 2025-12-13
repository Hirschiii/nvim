return {
   "dense-analysis/ale",
   event = "BufEnter",
   config = function()
      -- Configuration goes here.
      local g = vim.g
      g.ale_use_neovim_diagnostics_api = 1

      g.ale_linters = {
         -- ruby = {'rubocop', 'ruby'},
         -- lua = {'lua_language_server'}
         java = { "checkstyle" },
      }

      g.ale_java_checkstyle_config = "/home/niklas/projects/uni/proggen/uebung/blatt3/checkstyle-sheet3.xml"
g.ale_virtualtext_cursor = 'disabled'
      -- g.ale_java_checkstyle_config = vim.fn
      --    .system(
      --       "ls -d $HOME/projects/uni/proggen/uebung/blatt[0-9]* | sort -n | head -1 | sed 's/.*blatt//' | xargs -I {} echo \"$HOME/projects/uni/proggen/uebung/blatt{}/checkstyle-sheet{}.xml\""
      --    )
      --    :gsub("\n", "")
   end,
}
