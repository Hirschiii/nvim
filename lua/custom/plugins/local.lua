return {
   dir = "~/plugins/dyncs.nvim/",
   -- url = "git@codeberg.org:zenlima/dyncs.nvim.git",
   name = "dyncs",
   lazy = false,
   priority = 1000,
   cond = true,
   dependencies = {
      "tjdevries/colorbuddy.nvim",
   },
   opts = {
      -- colors = {
      --    text = "#b2ebb2",
      --    -- text = "#b2b2eb",
      --    -- text = "#FFB000",
      --    attention = "#fb4934",
      --    remove = "#fe8019",
      --    change = "#fabd2f",
      --    add = "#b8bb26",
      --    blue = "#afd7ff",
      --    gray = "#aeb9c2",
      -- },
   },
   config = function(_, opts)
      require("dyncs").config(opts)
      vim.cmd.colorscheme "dyncs"
   end,
}
