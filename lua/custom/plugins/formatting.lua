return {
   {
      -- Autoformatting
      "stevearc/conform.nvim",
      dependencies = { "mason.nvim" },
      lazy = true,
      cmd = "ConformInfo",
      keys = {
         {
            "<leader>cF",
            function()
               require("conform").format { formatters = { "injected" }, timeout_ms = 3000 }
            end,
            mode = { "n", "v" },
            desc = "Format Injected Langs",
         },
         {
            "<leader>cf",
            function()
               require("conform").format()
            end,
            mode = { "n", "v" },
            desc = "Format File",
         },
      },
      opts = {
         default_format_opts = {
            timeout_ms = 3000,
            async = true, -- not recommended to change
            quiet = true, -- not recommended to change
            lsp_format = "fallback", -- not recommended to change
         },
         formatters_by_ft = {
            lua = { "stylua" },
            elixir = { "mix" },
            markdown = { "prettierd", "prettier" },
         },
         formatters = {
            injected = { options = { ignore_errors = true } },
         },
      },
   },
}
