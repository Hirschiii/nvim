return {
   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
         { "folke/neodev.nvim", config = true },
         "williamboman/mason.nvim",
         "williamboman/mason-lspconfig.nvim",
         "WhoIsSethDaniel/mason-tool-installer.nvim",
         "nvim-telescope/telescope.nvim",
         { "j-hui/fidget.nvim", event = "LspAttach", config = true },
      },
      config = function()
         require "custom.lsp"
      end,
   },
   {
      "barreiroleo/ltex_extra.nvim",
      ft = { "markdown", "tex" },
      cond = false,
      dependencies = { "neovim/nvim-lspconfig" },
      -- yes, you can use the opts field, just I'm showing the setup explicitly
      config = function()
         require("ltex_extra").setup {
            -- your_ltex_extra_opts,
            server_opts = {
               -- capabilities = your_capabilities,
               on_attach = function(client, bufnr)
                  -- your on_attach process
               end,
               -- settings = {
               --     ltex = { your settings }
               -- }
               settings = {
                  ltex = {
                     enabled = { "latex", "tex", "bib", "markdown" },
                     language = "de-DE",
                     -- language = "auto",
                     diagnosticSeverity = "information",
                     sentenceCacheSize = 2000,
                     additionalRules = {
                        enablePickyRules = true,
                        motherTongue = "de",
                     },
                  },
               },
            },
         }
      end,
   },
   {
      -- Schema information
      "b0o/SchemaStore.nvim",
      ft = "json",
      -- event = "BufReadPre"
   },
}
