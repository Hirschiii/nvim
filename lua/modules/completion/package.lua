local conf = require('modules.completion.config')

packadd({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = { 'lua', 'rust', 'c', 'cpp' },
  config = conf.nvim_lsp,
})

packadd({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'onsails/lspkind.nvim' },
    { 'saadparwaiz1/cmp_luasnip' },
    { "rafamadriz/friendly-snippets" },
  },
})

packadd({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })
