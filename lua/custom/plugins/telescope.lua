return {
   {
      "nvim-telescope/telescope.nvim",
      -- event = "VeryLazy",
      dependencies = {
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
               pcall(require("telescope").load_extension, "fzf")
               -- pcall(require("telescope").load_extension, "smart_history")
            end,
         },

         {
            "nvim-telescope/telescope-smart-history.nvim",
            dependencies = {
               "kkharji/sqlite.lua",
            },
            config = function()
               pcall(require("telescope").load_extension, "smart_history")
            end,
         },
         {
            "nvim-telescope/telescope-ui-select.nvim",
            config = function()
               pcall(require("telescope").load_extension, "ui-select")
            end,
         },
         "nvim-lua/plenary.nvim",
      },
      keys = function()
         local builtin = require "telescope.builtin"
         return {
            { "<space>fd", builtin.find_files, mode = "n" },
            { "<space>ft", builtin.git_files, mode = "n" },
            { "<space>fh", builtin.help_tags, mode = "n" },
            { "<space>fg", builtin.live_grep, mode = "n" },
            { "<space>fb", builtin.buffers, mode = "n" },
            { "<space>/", builtin.current_buffer_fuzzy_find, mode = "n" },
            { "<space>gw", builtin.grep_string, mode = "n" },
            {
               "<space>fa",
               function()
                  ---@diagnostic disable-next-line: param-type-mismatch
                  builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
               end,
               mode = "n",
            },
            {
               "<space>en",
               function()
                  builtin.find_files { cwd = vim.fn.stdpath "config" }
               end,
               mode = "n",
            },
         }
      end,
      opts = function()
         local data = assert(vim.fn.stdpath "data") --[[@as string]]
         return {
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
