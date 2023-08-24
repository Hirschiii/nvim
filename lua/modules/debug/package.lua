local conf = require('modules.debug.config')

packadd({
  'mfussenegger/nvim-dap',
  event = 'BufRead',
  config = conf.dap,
  dependencies = {
    --   'nvim-treesitter/nvim-treesitter-textobjects',
    --   "nvim-treesitter/playground",
    --   "JoosepAlviste/nvim-ts-context-commentstring",
    --   "nvim-treesitter/nvim-treesitter-context",
    "rcarriga/nvim-dap-ui"
  },
})

packadd({
  'mfussenegger/nvim-dap-python',
  ft = "python",
  config = conf.python,
})


packadd({
  'mfussenegger/nvim-jdtls',
  ft = "java",
  dependencies = { "mfussenegger/nvim-dap"},
  config = conf.java,
})
