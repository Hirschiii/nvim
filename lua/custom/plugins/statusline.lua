return {
   {
      "tjdevries/express_line.nvim",
      event = "VeryLazy",
      cond = false,
      config = true,
   },
   {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      dependencies = { "nvim-tree/nvim-web-devicons" },
	  config = true
   },
}
