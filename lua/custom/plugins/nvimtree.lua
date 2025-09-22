return {
   "nvim-tree/nvim-tree.lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },

   version = "*",
   lazy = true,

   keys = { "<leader>m", "<leader>e" },
   config = function()
      require("nvim-tree").setup {}
      -- Directory Navigatio}n
      vim.keymap.set("n", "<leader>m", "NvimTreeFocus")
      vim.keymap.set("n", "<leader>e", "NvimTreeToggle")
   end,
}
