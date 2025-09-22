return {
   {
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      priority = 100,
	  enabled = true,
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
