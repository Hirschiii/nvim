local config = {}

function config.color()
	function ColorMyPencils(color)
		color = color or "dracula"
		vim.cmd.colorscheme(color)

		vim.g.limelight_conceal_ctermfg = 240

		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		local hl = function(thing, opts)
			vim.api.nvim_set_hl(0, thing, opts)
		end

		hl("SignColumn", {
			bg = "none",
		})

		hl("ColorColumn", {
			ctermbg = 0,
			bg = "#2B79A0",
		})

		hl("CursorLineNR", {
			bg = "None",
		})

		hl("Normal", {
			bg = "none",
		})

		hl("LineNr", {
			fg = "#5eacd3",
		})

		hl("netrwDir", {
			fg = "#5eacd3",
		})
	end

	ColorMyPencils()
end

-- function config.lualine()
--   require('lualine').setup()
-- end

function config.dashboard()
	local db = require("dashboard")
	db.setup({
		theme = "hyper",
		config = {
			week_header = {
				enable = true,
			},
			project = {
				enable = true,
			},
			disable_move = true,
			shortcut = {
				{
					desc = "Update",
					icon = " ",
					group = "Include",
					action = "Lazy update",
					key = "u",
				},
				{
					icon = " ",
					desc = "Files",
					group = "Function",
					action = "Telescope find_files find_command=rg,--ignore,--hidden,--files",
					key = "f",
				},
				-- {
				--   icon = ' ',
				--   desc = 'Apps',
				--   group = 'String',
				--   action = 'Telescope app',
				--   key = 'a',
				-- },
				{
					icon = " ",
					desc = "dotfiles",
					group = "Constant",
					action = "Telescope dotfiles",
					key = "d",
				},
			},
		},
	})
end

function config.nvim_bufferline()
	require("bufferline").setup({
		options = {
			modified_icon = "✥",
			buffer_close_icon = "",
			always_show_bufferline = false,
		},
	})
end

function config.indent_blankline()
	vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

	vim.opt.list = true
	vim.opt.listchars:append("space:⋅")
	vim.opt.listchars:append("eol:↴")

	require("indent_blankline").setup({
		use_treesitter_scope = true,
		show_first_indent_level = true,
		show_current_context = true,
		show_current_context_start = true,
		show_current_context_start_on_current_line = false,
		filetype_exclude = {
			"dashboard",
			"log",
			"TelescopePrompt",
		},
		buftype_exclude = { "terminal", "nofile", "prompt" },
		space_char_blankline = " ",
		char_highlight_list = {
			"IndentBlanklineIndent1",
			"IndentBlanklineIndent2",
			"IndentBlanklineIndent3",
			"IndentBlanklineIndent4",
			"IndentBlanklineIndent5",
			"IndentBlanklineIndent6",
		},
	})
end

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = "%#StatusLineAccent#"
	if current_mode == "n" then
		mode_color = "%#StatuslineAccent#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#StatuslineInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#StatuslineVisualAccent#"
	elseif current_mode == "R" then
		mode_color = "%#StatuslineReplaceAccent#"
	elseif current_mode == "c" then
		mode_color = "%#StatuslineCmdLineAccent#"
	elseif current_mode == "t" then
		mode_color = "%#StatuslineTerminalAccent#"
	end
	return mode_color
end

local function filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return " "
	end

	return string.format(" %%<%s/", fpath)
end

local function filename()
	local fname = vim.fn.expand("%:t")
	if fname == "" then
		return ""
	end
	return fname .. " "
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = " %#LspDiagnosticsSignError# " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = " %#LspDiagnosticsSignHint#󰎜 " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = " %#LspDiagnosticsSignInformation#󰋼 " .. count["info"]
	end

	return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function filetype()
	return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
	if vim.bo.filetype == "alpha" then
		return ""
	end
	return " %P %l:%c "
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		"%#Statusline#",
		update_mode_colors(),
		mode(),
		"%#Normal# ",
		filepath(),
		filename(),
		"%#Normal#",
		lsp(),
		"%=%#StatusLineExtra#",
		filetype(),
		lineinfo(),
	})
end

function Statusline.inactive()
	return " %F"
end

function Statusline.short()
	return "%#StatusLineNC#   NvimTree"
end

vim.api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]],
	false
)

return config
