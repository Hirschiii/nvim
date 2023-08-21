local conf = require('modules.lsp.config')

-- packadd({
--     "neovim/nvim-lspconfig",
--     config = conf.lsp_config,
--     dependencies = {
--   "williamboman/mason.nvim",
--   "williamboman/mason-lspconfig.nvim"}
-- })

packadd({
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },           -- Required
    { 'williamboman/mason.nvim' },         -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },   -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },   -- Required
  },
  config = conf.lsp_zero,
})