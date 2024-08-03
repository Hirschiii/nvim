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
      end,
   },
}
