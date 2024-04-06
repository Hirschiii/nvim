-- Set the leaderkey to " " (space)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- turn of builtin plugins we don't need
-- require("user.disable_builtin")

-- Setup globals that I expect to be always available.
--  See `./lua/tj/globals.lua` for more information.
require "user.globals"

require "user.keys"
require "user.set"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("custom.plugins", {
  dev = {
    -- directory where you store your local plugin projects
    path = "~/plugins",
    fallback = false,
  },
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
  defaults = { lazy = true },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        -- "netrwplugin",
        "tarplugin",
        "tohtml",
        "tutor",
        "zipplugin",
      },
    },
  },
})
