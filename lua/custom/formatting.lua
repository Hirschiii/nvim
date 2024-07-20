-- Automatic Linting
require('lint').linters_by_ft = {
	elixir = { "credo", }
}

-- Autoformatting Setup
require("conform").setup {
	formatters_by_ft = {
		lua = { "stylua" },
		elixir = { "mix" },
		markdown = { "prettierd", "prettier" }
	},
}

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format {
			bufnr = args.buf,
			lsp_fallback = true,
			quiet = true,
		}

		require("lint").try_lint()
	end,
})
