return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- Fügt eine Datei der Liste hinzu
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		-- Öffnet die Liste
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- Set <space>1..<space>5 be my shortcuts to moving to the files
		for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
			vim.keymap.set("n", string.format("<leader>%d", idx), function()
				harpoon:list():select(idx)
			end)
		end

		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
