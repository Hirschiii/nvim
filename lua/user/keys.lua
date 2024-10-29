vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
-- inoremap("jf", "<Esc>", { noremap = true })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open a fold with l
vim.opt.foldopen = "hor"
-- Close a fold with h when on the beginning of the line
vim.keymap.set("n", "h", function()
   local onIndentOrFirstNonBlank = vim.fn.virtcol "." <= vim.fn.indent "." + 1
   local shouldCloseFold = vim.tbl_contains(vim.opt_local.foldopen:get(), "hor")
   if onIndentOrFirstNonBlank and shouldCloseFold then
      local wasFolded = pcall(vim.cmd.normal, "zc")
      if wasFolded then
         return
      end
   end
   vim.cmd.normal { "h", bang = true }
end, { desc = "h (+ close fold at BoL)" })
