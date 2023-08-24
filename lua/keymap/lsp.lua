local which_key = require("modules.editor.config")
local mapping = {
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<cr>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    o = { "<cmd>Lspsaga outline<cr>", "Outline Symbols" },

    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  }
}

local opts = {
  mode = "n",         -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,       -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,      -- use `silent` when creating keymaps
  noremap = true,     -- use `noremap` when creating keymaps
  nowait = true,      -- use `nowait` when creating keymaps
}

-- return mapping, opts
which_key.which_key_regester(mapping, opts)
