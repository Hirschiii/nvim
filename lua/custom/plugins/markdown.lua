return {
   {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npx --yes yarn install",
      ft = "markdown",
   },
   { "junegunn/vim-easy-align", cmd = "EasyAlign" },
   {
      "MeanderingProgrammer/markdown.nvim",
      ft = "markdown",
      main = "render-markdown",
      enabled = false,
      opts = {},
      -- name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
      -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
      config = function()
         require "custom.markdown"
      end,
   },
   {
      "lervag/vimtex",
      ft = { "markdown" },
      -- lazy = false,
      config = function()
         vim.g.tex_flavor = "latex"
         vim.g.vimtex_view_method = "zathura"
         vim.g.vimtex_quickfix_mode = 0
         vim.opt.conceallevel = 1
         vim.g.tex_conceal = "abdmg"
      end,
   },
}
