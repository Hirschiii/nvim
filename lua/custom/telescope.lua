local data = assert(vim.fn.stdpath "data") --[[@as string]]

require("telescope").setup {
   defaults = {
      file_ignore_patterns = { "dune.lock" },
   },
   extensions = {
      wrap_results = true,

      fzf = {},
      history = {
         path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
         limit = 100,
      },
      ["ui-select"] = {
         require("telescope.themes").get_dropdown {},
      },
   },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<leader>fd", builtin.find_files)
vim.keymap.set("n", "<leader>ft", function()
   return builtin.git_files { cwd = vim.fn.expand "%:h" }
end)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>fg", require "custom.telescope.multi-ripgrep")
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

vim.keymap.set("n", "<leader>gw", builtin.grep_string)

vim.keymap.set("n", "<leader>fa", function()
   ---@diagnostic disable-next-line: param-type-mismatch
   builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
end)

vim.keymap.set("n", "<leader>fs", function()
   builtin.find_files { cwd = "app/src/main" }
end)

vim.keymap.set("n", "<leader>en", function()
   builtin.find_files { cwd = vim.fn.stdpath "config" }
end)

vim.keymap.set("n", "<leader>eo", function()
   builtin.find_files { cwd = "~/.config/nvim-backup/" }
end)

vim.keymap.set("n", "<leader>ew", function()
   builtin.find_files { cwd = "~/vimwiki/" }
end)

vim.keymap.set("n", "<leader>fp", function()
   builtin.find_files { cwd = "~/plugins/" }
end)
