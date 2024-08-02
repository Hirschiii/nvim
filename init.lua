--[[
-- Setup initial configuration,
--
-- Primarily just download and execute lazy.nvim
--]]
vim.g.mapleader = " "

require "user.keys"
require "user.set"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "custom/plugins" }, {
	change_detection = {
		check = true,
		notify = false,
	},
	defaults = {
		-- Set this to `true` to have all your plugins lazy-loaded by default.
		-- Only do this if you know what you are doing, as it can lead to unexpected behavior.
		lazy = true, -- should plugins be lazy-loaded?
	},
})

require "user.autocommands"
