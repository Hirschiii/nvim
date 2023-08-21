local config = {}

-- config server in this function
function config.nvim_lsp() end

function config.lsp_zero()
  local lsp = require('lsp-zero').preset({})


  require('mason-lspconfig').setup({
    ensure_installed = { 'html', 'custom_elements_ls' }
  })

  lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }
    vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
      vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
  end)

  -- (Optional) Configure lua language server for neovim
  require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

  lsp.setup()
end

return config
