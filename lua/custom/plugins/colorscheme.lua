return {
   {
   	"tjdevries/colorbuddy.nvim",
   	lazy = true,
   	-- priority = 100,
   	dependencies = {
   		{ "norcalli/nvim-colorizer.lua" },
   	},
   	-- config = function()
   	-- 	require "custom.colorsheme"
   	-- end,
   },
   {
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      priority = 100,
	  enabled = false,
      opts = {
         flavour = "mocha", -- latte, frappe, macchiato, mocha
         background = { -- :h background
            light = "latte",
            dark = "mocha",
         },
         transparent_background = true, -- disables setting the background color.
         which_key = true,
      },
      config = function(_, opts)
         require("catppuccin").setup(opts)
         vim.cmd.colorscheme "catppuccin-mocha"
      end,
   },
}
