return {
   {
      "kevinhwang91/nvim-bqf",
      enabled = false,
      config = function()
         require("bqf").setup()
      end,
   },
   {
      "stevearc/qf_helper.nvim",
      opts = {},
   },
   {
      "skywind3000/asyncrun.vim",
      cmd = { "AsyncRun" },
   },
}
