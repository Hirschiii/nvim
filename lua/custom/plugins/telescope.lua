return {
   {
      "nvim-telescope/telescope.nvim",
      lazy = true,
      dependencies = {
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
               require("telescope.builtin").git_files()
            end,
            mode = "n",
            desc = "Find Git Files",
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
			desc = "Find plugin files"
         },
         {
            "<space>fc",
            function()
               require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
            end,
            mode = "n",
			desc = "Find Configuration files for  nvim"
         },
      },
      config = function()
         local data = assert(vim.fn.stdpath "data") --[[@as string]]
         require("telescope").load_extension "fzf"
         require("telescope").load_extension "smart_history"
         require("telescope").load_extension "ui-select"
         require("telescope").setup {
            extensions = {
               wrap_results = true,

               fzf = {},
               history = {
                  path = vim.fs.joinpath(data, "telescope_history"),
                  limit = 100,
               },
               ["ui-select"] = {
                  require("telescope.themes").get_dropdown {},
               },
            },
         }
      end,
   },
}
