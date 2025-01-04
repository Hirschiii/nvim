return {
   {
      "nvim-telescope/telescope.nvim",
      lazy = true,
      dependencies = {
         {
            "glepnir/template.nvim",
            cmd = { "Template", "TemProject" },
            config = function()
               require("template").setup {
                  -- config in there
                  temp_dir = "~/.config/nvim/templates",
                  author = "Niklas von Hirschfeld",
               }
            end,
         },
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            -- config = function()
            --    pcall(require("telescope").load_extension, "fzf")
            --    -- pcall(require("telescope").load_extension, "smart_history")
            -- end,
         },

         {
            "nvim-telescope/telescope-smart-history.nvim",
            dependencies = {
               "kkharji/sqlite.lua",
            },
            -- config = function()
            --    pcall(require("telescope").load_extension, "smart_history")
            -- end,
         },
         {
            "nvim-telescope/telescope-ui-select.nvim",
            -- config = function()
            --    pcall(require("telescope").load_extension, "ui-select")
            -- end,
         },
         "nvim-lua/plenary.nvim",
      },
      keys = {
         {
            "<space>fd",
            function()
               require("telescope.builtin").find_files()
            end,
            mode = "n",
            desc = "Find Files",
         },
         {
            "<space>ft",
            function()
               vim.keymap.set("n", "<Leader>ft", function()
                  -- require("telescope.builtin").help_template()
                  -- require("telescope").extensions.find_template { type = "insert" }
                  require("telescope").extensions.find_template.find_template { type = "insert" }
                  -- vim.cmd "Telescope find_template type=insert"
               end, { remap = true })
            end,
            mode = "n",
            desc = "Find Templates",
         },
         {
            "<space>fh",
            function()
               require("telescope.builtin").help_tags()
            end,
            mode = "n",
            desc = "Search Helptags",
         },
         {
            "<space>fg",
            function()
               require("telescope.builtin").live_grep()
            end,
            mode = "n",
            desc = "Livegrep in files",
         },
         {
            "<space>fb",
            function()
               require("telescope.builtin").buffers()
            end,
            mode = "n",
            desc = "Find Buffers",
         },
         {
            "<space>/",
            function()
               require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            mode = "n",
            desc = "Search current Buffer",
         },
         {
            "<space>fa",
            function()
               ---@diagnostic disable-next-line: param-type-mismatch
               require("telescope.builtin").find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
            end,
            mode = "n",
            desc = "Find plugin files",
         },
         {
            "<space>fc",
            function()
               require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
            end,
            mode = "n",
            desc = "Find Configuration files for  nvim",
         },
      },
      cmd = { "Telescope" },
      config = function()
         local data = assert(vim.fn.stdpath "data") --[[@as string]]
         require("telescope").load_extension "fzf"
         require("telescope").load_extension "smart_history"
         require("telescope").load_extension "ui-select"
         require("telescope").load_extension "find_template"
         require("telescope").setup {
            extensions = {
               wrap_results = true,
               find_template = {},
               fzf = {},
               history = {
                  path = vim.fs.joinpath(data, "telescope_history"),
                  limit = 100,
               },
               ["ui-select"] = {
                  require("telescope.themes").get_dropdown {},
               },
            },
            pickers = {
               colorscheme = {
                  enable_preview = true,
               },
            },
         }
      end,
   },
}
