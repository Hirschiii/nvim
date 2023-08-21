local conf = require('modules.fun.config')

-- packadd({
--   'neovim/nvim-lspconfig',
--   -- used filetype to lazyload lsp
--   -- config your language filetype in here
--   ft = { 'lua', 'rust', 'c', 'cpp' },
--   config = conf.nvim_lsp,
-- })


packadd({
    "Eandrju/cellular-automaton.nvim",
    config = conf.cellulare_auto_config,
    cmd = "CellularAutomaton"
})
