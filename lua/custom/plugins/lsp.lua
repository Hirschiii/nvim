return {
   {
      "neovim/nvim-lspconfig",
      dependencies = {
         {
            -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
               library = {
                  -- Load luvit types when the `vim.uv` word is found
                  { path = "luvit-meta/library", words = { "vim%.uv" } },
                  { path = "/usr/share/awesome/lib/", words = { "awesome" } },
               },
            },
         },
         {
            "nvimdev/lspsaga.nvim",
            dependencies = {
               "nvim-treesitter/nvim-treesitter", -- optional
               "nvim-tree/nvim-web-devicons",
            },
         },
         { "Bilal2453/luvit-meta", lazy = true },
         "williamboman/mason.nvim",
         "williamboman/mason-lspconfig.nvim",
         "WhoIsSethDaniel/mason-tool-installer.nvim",

         { "j-hui/fidget.nvim", opts = {} },
         { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

         { "elixir-tools/elixir-tools.nvim" },

         -- Autoformatting
         "stevearc/conform.nvim",

         -- Schema information
         -- "b0o/SchemaStore.nvim",
         -- { dir = "~/plugins/ocaml.nvim" },
      },
      config = function()
         -- Don't do LSP stuff if we're in Obsidian Edit mode
         if vim.g.obsidian then
            return
         end

         local extend = function(name, key, values)
            local mod = require(string.format("lspconfig.configs.%s", name))
            local default = mod.default_config
            local keys = vim.split(key, ".", { plain = true })
            while #keys > 0 do
               local item = table.remove(keys, 1)
               default = default[item]
            end

            if vim.islist(default) then
               for _, value in ipairs(default) do
                  table.insert(values, value)
               end
            else
               for item, value in pairs(default) do
                  if not vim.tbl_contains(values, item) then
                     values[item] = value
                  end
               end
            end
            return values
         end

         local capabilities = nil
         if pcall(require, "cmp_nvim_lsp") then
            capabilities = require("cmp_nvim_lsp").default_capabilities()
         end

         local lspconfig = require "lspconfig"

         local servers = {
            bashls = true,
            lua_ls = true,
            kotlin_language_server = true,

            texlab = {
               filetypes = { "tex", "plaintex", "context", "latex" },
               settings = {
                  texlab = {
                     build = {
                        executable = "context",
                        args = { "--synctex", "%f" },

                        -- executable = "pdflatex",
                        -- args = { "--synctex=1", "%f" },
                        onSave = false,
                        forwardSearchAfter = false,
                     },
                     forwardSearch = {
                        -- executable = "zathura",
                        -- args = { "--synctex-forward", "%l:1:%f", "%p" },
                        -- executable = "evince-synctex",
                        -- args = { "sync", "%p", '"/home/niklas/.local/share/nvim/mason/bin/texlab -i %f -l %l"', "%l" },
                        executable = "zathura",
                        args = { "--synctex-forward", "%l:1:%f", "%p" },
                        onSave = true,
                     },
                     auxDirectory = ".",
                     bibtexFormatter = "texlab",
                     chktex = {
                        onEdit = false,
                        onOpenAndSave = true,
                     },
                     diagnosticsDelay = 300,
                     formatterLineLength = 80,
                     latexFormatter = "texlab",
                  },
               },
            },
            rust_analyzer = true,

            emmet_language_server = {
               filetypes = { "heex" },
            },

            pyright = true,

            -- cssls = {
            --   server_capabilities = {
            --     documentFormattingProvider = false,
            --   },
            -- },

            -- yamlls = {
            --    settings = {
            --       yaml = {
            --          schemaStore = {
            --             enable = false,
            --             url = "",
            --          },
            --          -- schemas = require("schemastore").yaml.schemas(),
            --       },
            --    },
            -- },
            --
            lexical = {
               root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
               cmd = { "/home/niklas/.local/share/nvim/mason/bin/lexical" },
               -- server_capabilities = {
               -- completionProvider = vim.NIL,
               -- definitionProvider = true,
               -- documentFormattingProvider = false,
               -- },
            },

            -- elixirls = {
            --    cmd = { "/home/niklas/.local/share/nvim/mason/bin/elixir-ls" },
            --    root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
            --    server_capabilities = {
            --       -- completionProvider = {
            --       --    resolveProvider = true,
            --       --    triggerCharacters = { ".", ":" },
            --       -- },
            --       definitionProvider = vim.NIL,
            --       documentFormattingProvider = true,
            --    },
            -- },

            -- tailwindcss = {
            --    init_options = {
            --       userLanguages = {
            --          elixir = "phoenix-heex",
            --          eruby = "erb",
            --          heex = "phoenix-heex",
            --       },
            --    },
            --    filetypes = extend("tailwindcss", "filetypes", { "ocaml.mlx" }),
            --    settings = {
            --       tailwindCSS = {
            --          experimental = {
            --             classRegex = {
            --                [[class: "([^"]*)]],
            --                [[className="([^"]*)]],
            --             },
            --          },
            --          includeLanguages = extend("tailwindcss", "settings.tailwindCSS.includeLanguages", {
            --             ["ocaml.mlx"] = "html",
            --          }),
            --       },
            --    },
            -- },
         }

         -- require("ocaml").setup()

         local servers_to_install = vim.tbl_filter(function(key)
            local t = servers[key]
            if type(t) == "table" then
               return not t.manual_install
            else
               return t
            end
         end, vim.tbl_keys(servers))

         require("mason").setup()
         local ensure_installed = {
            "stylua",
            "lua_ls",
            -- "tailwind-language-server",
         }

         vim.list_extend(ensure_installed, servers_to_install)
         require("mason-tool-installer").setup { ensure_installed = ensure_installed }

         for name, config in pairs(servers) do
            if config == true then
               config = {}
            end
            config = vim.tbl_deep_extend("force", {}, {
               capabilities = capabilities,
            }, config)

            vim.lsp.config[name] = config
         end

         -- local disable_semantic_tokens = {
         --    lua = true,
         -- }

         vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
               local bufnr = args.buf
               local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

               local settings = servers[client.name]
               if type(settings) ~= "table" then
                  settings = {}
               end

               local builtin = require "telescope.builtin"
               local opts = { buffer = args.buf }

               vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
               vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
               vim.keymap.set("n", "gr", builtin.lsp_references, opts)
               vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
               vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
               -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
               vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

               vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
               vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
               vim.keymap.set("n", "<space>cf", vim.lsp.buf.format, opts)

               vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, opts)
               vim.keymap.set("n", "<space>vd", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
               vim.keymap.set("n", "<leader>d", function()
                  vim.diagnostic.open_float(nil, { focus = false })
               end, { desc = "Zeige Diagnose in Popup" })

               vim.keymap.set("i", "<C-h>", function()
                  vim.lsp.buf.signature_help()
               end, opts)

               local filetype = vim.bo[bufnr].filetype
               if disable_semantic_tokens[filetype] then
                  client.server_capabilities.semanticTokensProvider = nil
               end

               -- Override server capabilities
               if settings.server_capabilities then
                  for k, v in pairs(settings.server_capabilities) do
                     if v == vim.NIL then
                        ---@diagnostic disable-next-line: cast-local-type
                        v = nil
                     end

                     client.server_capabilities[k] = v
                  end
               end
            end,
         })

         require("custom.autoformat").setup()

         require("lsp_lines").setup()
         vim.diagnostic.config { virtual_text = false, virtual_lines = false }

         vim.keymap.set("", "<leader>l", function()
            local config = vim.diagnostic.config() or {}
            if config.virtual_lines then
               vim.diagnostic.config { virtual_lines = false }
            else
               vim.diagnostic.config { virtual_lines = true }
            end
         end, { desc = "Toggle lsp_lines" })

         -- require("custom.elixir").setup()

         require("lspsaga").setup {
            lightbulb = {
               enable = false,
               virtual_text = false,
            },
         }
      end,
   },
}
