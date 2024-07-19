return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

			"nvim-telescope/telescope-smart-history.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			-- "kkharji/sqlite.lua",
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require "custom.telescope"
		end,
	},
}
