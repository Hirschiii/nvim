-- TODO:
-- or things to try out
--  - train.nvim
--  - neogit
--  - neorg
--  - which-key.nvim
--  - danymat/neogen

return {
  { "nvim-lua/plenary.nvim", dev = false },
  { "tjdevries/express_line.nvim", dev = false },

  "milisims/nvim-luaref",
  { "tpope/vim-surround", event = "InsertEnter" },
  { "tjdevries/colorbuddy.nvim", lazy = false, priority = 100 },
  "tpope/vim-repeat", -- Repeat actions better
  "tpope/vim-characterize", -- ?

  "monaqa/dial.nvim",

  -- {
  --   "glacambre/firenvim",
  --   build = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  -- },

  "projekt0n/github-nvim-theme",
}
