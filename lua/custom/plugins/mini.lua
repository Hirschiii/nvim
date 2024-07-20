return {
	{
		"echasnovski/mini.nvim",
		event = "VimEnter",
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()
		end,
	},
}
