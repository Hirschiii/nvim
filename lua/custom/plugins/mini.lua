return {
	{
		"echasnovski/mini.ai",
		event = { "BufReadPost", "BufNewFile"},
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		event = { "InsertEnter" },
		config = function()
			require("mini.surround").setup()
		end,
	},
   {
      "echasnovski/mini.icons",
      lazy = true,
      opts = {
         file = {
            [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
            ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
         },
         filetype = {
            dotenv = { glyph = "", hl = "MiniIconsYellow" },
         },
      },
      init = function()
         package.preload["nvim-web-devicons"] = function()
            require("mini.icons").mock_nvim_web_devicons()
            return package.loaded["nvim-web-devicons"]
         end
      end,
   },
}
