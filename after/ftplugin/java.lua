-- Deaktiviert Tabs (FileTabCharacter) und erzwingt 4 Leerzeichen (Einrückung)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- Zeigt die maximale Zeilenlänge (LineLength max="140") visuell an
vim.opt_local.colorcolumn = "80"


-- require('lint.linters.checkstyle').config_file = '/home/niklas/projects/uni/proggen/uebung/blatt1/checkstyle-sheet1.xml'

require('lint.linters.checkstyle').config_file = vim.fn.system('ls -d $HOME/projects/uni/proggen/uebung/blatt[0-9]* | sort -n | head -1 | sed \'s/.*blatt//\' | xargs -I {} echo "$HOME/projects/uni/proggen/uebung/blatt{}/checkstyle-sheet{}.xml"'):gsub('\n', '')
