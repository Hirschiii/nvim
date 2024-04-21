return {
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		config = function()
			local nmap = require("user.keymap").nmap

			local harpoon = require "harpoon"

			harpoon.setup {}

			nmap { "<leader>a", require("harpoon.mark").add_file }
			nmap { "<C-e>", require("harpoon.ui").toggle_quick_menu }

			for i = 1, 5 do
				nmap {
					string.format("<space>%s", i),
					function()
						require("harpoon.ui").nav_file(i)
					end,
				}
			end
		end,
	},
}
