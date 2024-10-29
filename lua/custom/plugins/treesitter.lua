return {
   {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      build = ":TSUpdate",
      event = { "BufReadPre" },
      lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
      -- enable = false,
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
         "nvim-treesitter/playground",
      },
      keys = {
         { "<c-space>", desc = "Increment Selection" },
         { "<bs>", desc = "Decrement Selection", mode = "x" },
      },
      opts = {
         highlight = {
            enable = true,
            -- disable = { "latex" },
            -- additional_vim_regex_highlighting = { "latex", "markdown" },
         },
         indent = {
            enable = true,
            -- disable = { "context" }, -- Disable indentation processing
         },
         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = "<C-space>",
               node_incremental = "<C-space>",
               scope_incremental = false,
               node_decremental = "<bs>",
            },
         },
         ensure_install = { "core", "elixir", "heex", "eex", "markdown", "markdown_inline", "latex" },
         markdown = {
            enable = true,
         },
         textobjects = {
            move = {
               enable = true,
               goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
               goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
               goto_previous_start = {
                  ["[f"] = "@function.outer",
                  ["[c"] = "@class.outer",
                  ["[a"] = "@parameter.inner",
               },
               goto_previous_end = {
                  ["[F"] = "@function.outer",
                  ["[C"] = "@class.outer",
                  ["[A"] = "@parameter.inner",
               },
            },
         },
      },
      cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
      config = function(_, opts)
         require("nvim-treesitter.configs").setup(opts)

         -- Adding the ConTeXt-TS
         -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
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
      end,
   },
}
