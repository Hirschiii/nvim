return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npx --yes yarn install",
    ft = "markdown",
  },
  { "junegunn/vim-easy-align", cmd = "EasyAlign" },
  {
    "ixru/nvim-markdown",
    ft = "markdown",
    -- lazy = false,
    -- dependencies = {
    -- 	'nvim-treesitter/nvim-treesitter',
    -- },
    config = function()
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_math = 1
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
      vim.opt.conceallevel = 0
      vim.g.tex_conceal = "abdmg"
    end,
  },
}
