---@diagnostic disable: assign-type-mismatch
local opt = vim.opt

opt.pumheight = 20

opt.foldmethod = "manual"

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.smartindent = true

opt.wrap = false

-- opt.list = true
-- opt.listchars = { tab="-->", eol="$" }

opt.mouse = ""

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append "@-@"

opt.updatetime = 50

opt.colorcolumn = ""

vim.o.clipboard = "unnamedplus"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

opt.cursorline = true
opt.cursorcolumn = true

----- Interesting Options -----

-- You have to turn this one on :)
opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment
opt.formatoptions:remove "o"
