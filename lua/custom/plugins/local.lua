return {
   dir = "~/plugins/dyncs.nvim/",
   -- url = "git@codeberg.org:zenlima/dyncs.nvim.git",
   name = "dyncs",
   lazy = false,
   priority = 1000,
   cond = true,
   -- enabled = false,
   dependencies = {
      "tjdevries/colorbuddy.nvim",
   },
   opts = {
      debug = nil,
      -- colors = {
      -- 	text = "#ebdbb2",
      -- 	attention = "#fb4934",
      -- 	remove = "#fe8019",
      -- 	change = "#fabd2f",
      -- 	add = "#b8bb26",
      -- 	light_blue = "#afd7ff",
      -- 	dark_blue = "#4a5a6b",
      -- 	gray = "#aeb9c2",
      -- 	red = "#de4479",
      -- },
   },
   config = function(_, opts)
      require("dyncs").config(opts)
      vim.cmd.colorscheme "dyncs"
   end,
}
