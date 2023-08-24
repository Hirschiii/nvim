local api = vim.api
require('keymap.remap')
require('keymap.lsp')
local map = require('core.keymap')
local wk = require("which-key")
local cmd = map.cmd

map.n({
  -- Lspsaga
  ['[e'] = cmd('Lspsaga diagnostic_jump_next'),
  [']e'] = cmd('Lspsaga diagnostic_jump_prev'),
  ['K'] = cmd('Lspsaga hover_doc'),
  ['ga'] = cmd('Lspsaga code_action'),
  ['gd'] = cmd('Lspsaga peek_definition'),
  ['gp'] = cmd('Lspsaga goto_definition'),
  ['gr'] = cmd('Lspsaga rename'),
  ['gh'] = cmd('Lspsaga finder'),
  ['<Leader>o'] = cmd('Lspsaga outline'),
  ['<Leader>dw'] = cmd('Lspsaga show_workspace_diagnostics'),
  ['<Leader>db'] = cmd('Lspsaga show_buf_diagnostics'),
  -- flybuf.nvim
})


wk.register({
  j = { cmd("FlyBuf"), "Flowting Buffer" },
  t = {
    name = "file", -- optional group name
    a = { cmd('Telescope live_grep'), "Live Grep" },
    s = { cmd('Telescope grep_string'), "Grep String" },
    f = { cmd('Telescope find_files find_command=rg,--ignore,--hidden,--files'), "Find Files" },
    h = { cmd('Telescope help_tags'), "Help Tags" },
    o = { cmd('Telescope oldfiles'), "Old Files" },
    d = { cmd('Telescope dotfiles'), "Dotfiles" }
  },
}, { prefix = "<leader>" })
