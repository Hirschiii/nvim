local conf = require('modules.editor.config')

packadd({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    "nvim-treesitter/playground",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-context",
  },
})

packadd({
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "InsertEnter",
  config = conf.nvim_surround,
})

packadd({

  "numToStr/Comment.nvim",
  event = { "BufNewFile", "BufRead" },
  config = conf.comment,
})

packadd({
  "windwp/nvim-autopairs",
  config = conf.nvim_autopairs,
  event = "InsertEnter",
})

packadd({
  'junegunn/vim-easy-align', ft = "markdown"
})

packadd({
  "windwp/nvim-ts-autotag",
  ft = { "html" },
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  config = conf.ts_autotag,
})

packadd({
'turbio/bracey.vim',
cmd = { "Bracey"},
built = "npm install --prefix -g server"
})
