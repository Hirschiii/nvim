local config = {}

function config.dap()
  local builtin_dap = {
    active = true,
    on_config_done = nil,
    breakpoint = {
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    },
    breakpoint_rejected = {
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    },
    stopped = {
      texthl = 'DiagnosticSignWarn',
      linehl = 'Visual',
      numhl = 'DiagnosticSignWarn',
    },
    log = {
      level = 'info',
    },
    ui = {
      auto_open = true,
      notify = {
        threshold = vim.log.levels.INFO,
      },
      config = {
        icons = { expanded = '', collapsed = '', circular = '' },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        -- Use this to override mappings for specific elements
        element_mappings = {},
        expand_lines = true,
        layouts = {
          {
            elements = {
              { id = 'scopes', size = 0.33 },
              { id = 'breakpoints', size = 0.17 },
              { id = 'stacks', size = 0.25 },
              { id = 'watches', size = 0.25 },
            },
            size = 0.33,
            position = 'right',
          },
          {
            elements = {
              { id = 'repl', size = 0.45 },
              { id = 'console', size = 0.55 },
            },
            size = 0.27,
            position = 'bottom',
          },
        },
        controls = {
          enabled = true,
          -- Display controls in this element
          element = 'repl',
          icons = {
            pause = '',
            play = '',
            step_into = '',
            step_over = '',
            step_out = '',
            step_back = '',
            run_last = '',
            terminate = '',
          },
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5, -- Floats will be treated as percentage of your screen.
          border = 'rounded',
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        },
      },
    },
  }

  local status_ok, dap = pcall(require, 'dap')
  if not status_ok then
    return
  end
  local dapui = require('dapui')
  dapui.setup(builtin_dap.ui.config)
end

function config.python()
  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
end

function config.java() end

return config
