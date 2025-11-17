-- Deaktiviert Tabs (FileTabCharacter) und erzwingt 4 Leerzeichen (Einrückung)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- Zeigt die maximale Zeilenlänge (LineLength max="140") visuell an
vim.opt_local.colorcolumn = "80"


require('lint.linters.checkstyle').config_file = '/home/niklas/projects/uni/proggen/uebung/sheet1_uebungsblatt/checkstyle-sheet1.xml'
