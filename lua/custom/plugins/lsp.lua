return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "folke/neodev.nvim", opt = {} },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", event = "LspAttach" },


		},
		config = function()
			require("custom.lsp")
		end,
	},
	{ -- Autoformatting
		"stevearc/conform.nvim",
		event = "BufReadPost",
		dependencies = {
			"mfussenegger/nvim-lint",
		},
		config = function()
			require("custom.formatting")
		end,
	},

	{
		-- Schema information
		"b0o/SchemaStore.nvim",
		ft = "json",
		-- event = "BufReadPre"
	}
}
