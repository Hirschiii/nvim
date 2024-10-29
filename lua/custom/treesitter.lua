-- local treesitter = require "nvim-treesitter"

print "Tree is executed"

local M = {}

M.setup = function()
   local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })
   -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

   require("nvim-treesitter").setup {
      ensure_install = { "core", "elixir", "heex", "eex" },
   }

   -- parser_config.context = {
   --    install_info = {
   --       url = "https://github.com/pmazaitis/tree-sitter-context", -- local path or git repo
   --       files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
   --       -- optional entries:
   --       branch = "main", -- default branch in case of git repo if different from master
   --       generate_requires_npm = false, -- if stand-alone parser without npm dependencies
   --       requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
   --    },
   --    filetype = "context", -- if filetype does not match the parser name
   -- }

   print "Tree ter"

   local syntax_on = {
      elixir = true,
      php = true,
   }

   vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(args)
         local bufnr = args.buf
         local ft = vim.bo[bufnr].filetype
         pcall(vim.treesitter.start)

         if syntax_on[ft] then
            vim.bo[bufnr].syntax = "on"
         end
      end,
   })
end

M.setup()

return M
