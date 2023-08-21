local conf = require('modules.ui.config')

packadd({
  "folke/tokyonight.nvim",
  config = conf.color,
})

-- packadd({
--   'nvim-lualine/lualine.nvim',
--   dependencies = {
--     { 'nvim-tree/nvim-web-devicons', opt = true }
--   }
-- })

packadd({
  'glepnir/dashboard-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = conf.dashboard
})

packadd({
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  config = conf.indent_blankline,
})
