return {
   {
      "nvim-telescope/telescope.nvim",
      dependencies = {
         { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope-smart-history.nvim",
         "nvim-telescope/telescope-ui-select.nvim",
         "kkharji/sqlite.lua",
      },
      keys = {
         "<leader>fd",
         "<leader>ft",
         "<leader>fh",
         "<leader>fg",
         "<leader>fb",
         "<leader>/",
         "<leader>gw",
         "<leader>fa",
         "<leader>fs",
         "<leader>en",
         "<leader>eo",
         "<leader>ew",
         "<leader>fp",
      },
      config = function()
         require "custom.telescope"
      end,
   },
}
