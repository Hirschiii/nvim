return {
   {
      "nvim-treesitter/nvim-treesitter",
      -- dependencies = {},
      build = ":TSUpdate",
      branch = "main",
      lazy = true,
	  event = "BufEnter",
      config = function()
         require("custom.treesitter").setup()
      end,
   },
}
