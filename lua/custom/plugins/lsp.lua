return {
   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPost", "BufNewFile" },
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
      -- Schema information
      "b0o/SchemaStore.nvim",
      ft = "json",
      -- event = "BufReadPre"
   },
}
