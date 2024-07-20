return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		event = "BufReadPre",
		config = function()
			require("custom.treesitter").setup()
		end,
	},
	-- {
	-- 	"hiphish/rainbow-delimiters.nvim"
	-- }
}
