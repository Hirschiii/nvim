local conf = require("modules.editor.config")

packadd({
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	run = ":TSUpdate",
	config = conf.nvim_treesitter,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-context",
	},
})

packadd({
	"junegunn/vim-easy-align",
})

packadd({
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = conf.which_key,
})

packadd({
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "InsertEnter",
	config = conf.nvim_surround,
})

packadd({

	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = conf.comment,
})

packadd({
	"windwp/nvim-autopairs",
	config = conf.nvim_autopairs,
	event = "InsertEnter",
})

packadd({
	"junegunn/vim-easy-align",
	ft = "markdown",
})

packadd({
	"windwp/nvim-ts-autotag",
	ft = { "html" },
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	config = conf.ts_autotag,
})

packadd({
	"turbio/bracey.vim",
	cmd = { "Bracey" },
	built = "npm install --prefix server",
})

packadd({
	"folke/neodev.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = conf.neodev,
})

packadd({
	"glepnir/flybuf.nvim",
	cmd = "FlyBuf",
	config = function()
		require("flybuf").setup({})
	end,
})

packadd({
	"nvimdev/guard.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = conf.guard,
})

packadd({
	"iamcco/markdown-preview.nvim",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	ft = "markdown",
})
