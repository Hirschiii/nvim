vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.clipboard = "unnamedplus"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Best search settings :)
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = "yes"
vim.opt.shada = { "'10", "<0", "s10", "h" }

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"
