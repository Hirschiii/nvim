local api = vim.api
require('keymap.remap')
require('keymap.lsp')
local map = require('core.keymap')
local wk = require('which-key')
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
  -- flybuf.nvim
})

wk.register({
  j = { cmd('FlyBuf'), 'Flowting Buffer' },
  t = {
    name = 'file', -- optional group name
    a = { cmd('Telescope live_grep'), 'Live Grep' },
    s = { cmd('Telescope grep_string'), 'Grep String' },
    f = { cmd('Telescope find_files find_command=rg,--ignore,--hidden,--files'), 'Find Files' },
    h = { cmd('Telescope help_tags'), 'Help Tags' },
    o = { cmd('Telescope oldfiles'), 'Old Files' },
    d = { cmd('Telescope dotfiles'), 'Dotfiles' },
  },
  v = {
    w = { cmd('Lspsaga show_workspace_diagnostics'), 'Saga Work. Diagnostics' },
    b = { cmd('Lspsaga show_buf_diagnostics'), 'Saga Buf. Diagnostics' },
    d = { cmd('Lspsaga show_line_diagnostics'), 'Line Diag' },
    c = { cmd('Lspsaga show_cursor_diagnostics'), 'Cursor Diag' },
  },
}, { prefix = '<leader>' })
