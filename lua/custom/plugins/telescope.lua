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
				end
			},

			{
				"nvim-telescope/telescope-smart-history.nvim",
				dependencies = {
					"kkharji/sqlite.lua",
				},
				config = function()
					pcall(require("telescope").load_extension, "fzf")
					-- pcall(require("telescope").load_extension, "smart_history")
				end
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
				config = function()
					pcall(require("telescope").load_extension, "ui-select")
				end
			},
			'nvim-lua/plenary.nvim'
		},
		keys = {
			{ "<space>fd", require('telescope.builtin').find_files,                mode = "n" },
			{ "<space>ft", require('telescope.builtin').git_files,                 mode = "n" },
			{ "<space>fh", require('telescope.builtin').help_tags,                 mode = "n" },
			{ "<space>fg", require('telescope.builtin').live_grep,                 mode = "n" },
			{ "<space>fb", require('telescope.builtin').buffers,                   mode = "n" },
			{ "<space>/",  require('telescope.builtin').current_buffer_fuzzy_find, mode = "n" },
			{ "<space>gw", require('telescope.builtin').grep_string,               mode = "n" },
			{
				"<space>fa",
				function()
					---@diagnostic disable-next-line: param-type-mismatch
					require('telescope.builtin').find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
				end,
				mode = "n"
			},
			{
				"<space>en",
				function()
					require('telescope.builtin').find_files { cwd = vim.fn.stdpath "config" }
				end,
				mode = "n"
			}
		},
		-- keys = { '<space>fd', '<space>ft', '<space>fh', '<space>fg', '<space>fb', '<space>/', '<space>gw', '<space>fa', '<space>en' },
		opt = function()
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
		-- config = function(_, opts)
		-- 	local builtin = require "telescope.builtin"
		--
		-- 	vim.keymap.set("n", "<space>fd", builtin.find_files)
		-- 	vim.keymap.set("n", "<space>ft", builtin.git_files)
		-- 	vim.keymap.set("n", "<space>fh", builtin.help_tags)
		-- 	vim.keymap.set("n", "<space>fg", builtin.live_grep)
		-- 	vim.keymap.set("n", "<space>fb", builtin.buffers)
		-- 	vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
		--
		-- 	vim.keymap.set("n", "<space>gw", builtin.grep_string)
		--
		-- 	vim.keymap.set("n", "<space>fa", function()
		-- 		---@diagnostic disable-next-line: param-type-mismatch
		-- 		builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
		-- 	end)
		--
		-- 	vim.keymap.set("n", "<space>en", function()
		-- 		builtin.find_files { cwd = vim.fn.stdpath "config" }
		-- 	end)
		-- end,
	},
}
