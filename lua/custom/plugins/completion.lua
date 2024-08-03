return {
   {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
         -- "onsails/lspkind.nvim",
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-buffer",
         "nvim-tree/nvim-web-devicons",
         "hrsh7th/cmp-calc",
         { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
         "saadparwaiz1/cmp_luasnip",
         "rafamadriz/friendly-snippets",
      },
      config = function()
         require "custom.completion"
      end,
   },
   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
      -- use opts = {} for passing setup options
      -- this is equalent to setup({}) function
   },
}
