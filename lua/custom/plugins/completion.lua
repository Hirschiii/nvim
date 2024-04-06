--     use "lukas-reineke/cmp-under-comparator"

return {
  {
    "hrsh7th/nvim-cmp",
  },
  { "hrsh7th/cmp-buffer", event = "VeryLazy" },
  { "hrsh7th/cmp-path", event = "VeryLazy" },
  { "hrsh7th/cmp-nvim-lua", event = "VeryLazy" },
  { "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" },
  { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" }, event = "VeryLazy" },
  { "tamago324/cmp-zsh", event = "VeryLazy" },
  { "onsails/lspkind-nvim", event = "VeryLazy" },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = function()
  --     require("copilot").setup()
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
