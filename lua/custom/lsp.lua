require("neodev").setup {
   -- library = {
   --   plugins = { "nvim-dap-ui" },
   --   types = true,
   -- },
}

vim.diagnostic.config {
   underline = true,
   update_in_insert = false,
   -- virtual_text = false,
   virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
      -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
      -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
      -- prefix = "icons",
   },
   float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "if_many",
      header = "",
      prefix = "",
   },
   severity_sort = true,
   -- signs = {
   -- 	text = {
   -- 		[vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
   -- 		[vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
   -- 		[vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
   -- 		[vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
   -- 	},
   -- },
}

vim.lsp.inlay_hint.enable(false, nil)

local default_capabilities = nil
if pcall(require, "cmp_nvim_lsp") then
   -- capabilities = require("cmp_nvim_lsp").default_capabilities()
   default_capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
   )
end

local lspconfig = require "lspconfig"

local servers = {
   astro = true,
   cssls = true,
   html = true,
   emmet_language_server = true,
   bashls = true,
   -- gopls = {
   -- 	settings = {
   -- 		gopls = {
   -- 			hints = {
   -- 				assignVariableTypes = true,
   -- 				compositeLiteralFields = true,
   -- 				compositeLiteralTypes = true,
   -- 				constantValues = true,
   -- 				functionTypeParameters = true,
   -- 				parameterNames = true,
   -- 				rangeVariableTypes = true,
   -- 			},
   -- 		},
   -- 	},
   -- },
   lua_ls = {
      capabilities = {
         semanticTokensProvider = true,
      },
   },
   -- java_language_server = {
   --    cmd = { os.getenv "HOME" .. "/.local/share/nvim/mason/bin/java-language-server" },
   -- },
   -- rust_analyzer = true,
   -- svelte = true,
   -- templ = true,
   -- cssls = true

   -- Probably want to disable formatting for this lang server
   -- tsserver = {
   -- 	server_capabilities = {
   -- 		documentFormattingProvider = false,
   -- 	},
   -- },
   -- biome = true,

   jsonls = {
      settings = {
         json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
         },
      },
   },
   --
   -- yamlls = {
   -- 	settings = {
   -- 		yaml = {
   -- 			schemaStore = {
   -- 				enable = false,
   -- 				url = "",
   -- 			},
   -- 			schemas = require("schemastore").yaml.schemas(),
   -- 		},
   -- 	},
   -- },

   elixirls = {
      cmd = { os.getenv "HOME" .. "/.local/share/nvim/mason/bin/elixir-ls" },
      root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
      capabilities = {
         completionProvider = true,
         definitionProvider = true,
         semanticTokensProvider = true,
         documentFormattingProvider = false,
      },
      settings = {
         elixirLS = {
            dialyzerEnabled = true,
            fetchDeps = false,
         },
      },
   },
   -- nextls = {
   -- 	cmd = { os.getenv "HOME" .. "/.local/share/nvim/mason/bin/nextls" },
   -- 	root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
   -- 	server_capabilities = {
   -- 		-- completionProvider = true,
   -- 		-- definitionProvider = false,
   -- 		documentFormattingProvider = false,
   -- 	},
   -- },

   -- lexical = {
   -- 	cmd = { os.getenv "HOME" .. "/.local/share/nvim/mason/bin/lexical" },
   -- 	root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
   -- 	server_capabilities = {
   -- 		completionProvider = false,
   -- 		definitionProvider = false,
   -- 	},
   -- },

   marksman = {
      cmd = { os.getenv "HOME" .. "/.local/share/nvim/mason/bin/marksman" },
   },
   -- ltex = {
   --    cmd = { os.getenv "HOME" .. "/.local/share/nvim/mason/bin/ltex-ls" },
   --    settings = {
   --       ltex = {
   --          enabled = { "latex", "tex", "bib", "markdown" },
   --          -- language = "de-DE",
   --          language = "auto",
   --          diagnosticSeverity = "information",
   --          sentenceCacheSize = 2000,
   --          additionalRules = {
   --             enablePickyRules = true,
   --             motherTongue = "de",
   --          },
   --       },
   --    },
   -- },

   -- clangd = {
   -- 	-- TODO: Could include cmd, but not sure those were all relevant flags.
   -- 	--    looks like something i would have added while i was floundering
   -- 	init_options = { clangdFileStatus = true },
   -- 	filetypes = { "c" },
   -- },
}

local servers_to_install = vim.tbl_filter(function(key)
   local t = servers[key]
   if type(t) == "table" then
      return not t.manual_install
   else
      return t
   end
end, vim.tbl_keys(servers))

require("mason").setup()
local ensure_installed = { "jsonls", "elixirls", "lua_ls" }

vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup { ensure_installed = ensure_installed }

for name, config in pairs(servers) do
   if config == true then
      config = {}
   end
   config = vim.tbl_deep_extend("force", { capabilities = default_capabilities }, config)

   lspconfig[name].setup(config)
end

vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(args)
      local bufnr = args.buf
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

      local settings = servers[client.name]
      if type(settings) ~= "table" then
         settings = {}
      end

      local builtin = require "telescope.builtin"

      vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
      vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
      vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
      vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
      vim.keymap.set("n", "<space>v", vim.diagnostic.open_float, { buffer = 0 })

      vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, { buffer = 0 })

      vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
      vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })

      -- Override server capabilities
      -- if settings.server_capabilities then
      --    for k, v in pairs(settings.server_capabilities) do
      --       if v == vim.NIL then
      --          ---@diagnostic disable-next-line: cast-local-type
      --          v = nil
      --       end
      --
      --       client.server_capabilities[k] = v
      --    end
      -- end
   end,
})
