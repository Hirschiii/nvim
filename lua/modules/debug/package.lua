local conf = require('modules.debug.config')

packadd({
  'mfussenegger/nvim-dap',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.dap,
  dependencies = {
    --   'nvim-treesitter/nvim-treesitter-textobjects',
    --   "nvim-treesitter/playground",
    --   "JoosepAlviste/nvim-ts-context-commentstring",
    --   "nvim-treesitter/nvim-treesitter-context",
    'rcarriga/nvim-dap-ui',
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = {},
    },
    {
      'jay-babu/mason-nvim-dap.nvim',
      dependencies = 'mason.nvim',
      cmd = { 'DapInstall', 'DapUninstall' },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
        },
      },
    },
  },
})

packadd({
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  config = conf.python,
})

packadd({
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  dependencies = { 'mfussenegger/nvim-dap' },
  config = conf.java,
})
