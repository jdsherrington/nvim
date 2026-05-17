local opt = vim.opt

opt.termguicolors = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.undofile = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.scrolloff = 5
opt.splitright = true
opt.splitbelow = true
opt.inccommand = 'split'
opt.showmode = false
opt.fillchars:append({ eob = ' ' })

opt.ignorecase = true
opt.smartcase = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.breakindent = true

opt.updatetime = 250
opt.timeoutlen = 300
