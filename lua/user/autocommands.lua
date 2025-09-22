-- Create autocmd group
local group = vim.api.nvim_create_augroup("CursorLineColumn", { clear = true })

-- Define autocmds
vim.api.nvim_create_autocmd("WinLeave", {
  group = group,
  callback = function()
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  group = group,
  callback = function()
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
  end,
})
