local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require('nvim-treesitter.configs').setup({
    autotag = {
      enable = true,
    },
    ensure_installed = { 'html', 'lua' },
    ignore_install = { 'phpdoc' },
    highlight = {
      enable = true,
    },
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = false },

      smart_rename = {
        enable = false,
        keymaps = {
          -- mapping to rename reference under cursor
          smart_rename = "grr",
        },
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<M-w>",     -- maps in normal mode to init the node/scope selection
        node_incremental = "<M-w>",   -- increment to the upper named parent
        node_decremental = "<M-C-w>", -- decrement to the previous node
        scope_incremental = "<M-e>",  -- increment to the upper scope (as defined in locals.scm)
      },
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
    context_commentstring = {
      enable = true,

      -- With Comment.nvim, we don't need to run this on the autocmd.
      -- Only run it in pre-hook
      enable_autocmd = false,

      config = {
        c = "// %s",
        lua = "-- %s",
      },
    },
  })
end

function config.nvim_surround()
  require("nvim-surround").setup({
    -- Configuration here, or leave empty to use defaults
  })
end

function config.comment()
  require("Comment").setup()
end

function config.nvim_autopairs()
  require("nvim-autopairs").setup {}
end

function config.ts_autotag()
end

return config
