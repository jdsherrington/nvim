-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt -- Alias for vim.opt
local g = vim.g -- Alias for vim.g
local o = vim.o -- Alias for vim.o

-- [[ General ]]
opt.termguicolors = false -- Use cterm colors (as per your original config)
g.colors_override = 'cterm'
g.colortemplate_toolbar = 0
opt.mouse = 'a' -- Enable mouse mode
opt.mousescroll = 'ver:1,hor:1' -- Fine-tune mouse scroll steps
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.undofile = true -- Save undo history

-- [[ UI ]]
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Relative line numbers
opt.statuscolumn = '%s%=%{v:lnum}  ' -- Custom status column format
o.cmdheight = 0 -- Hide command line unless needed
opt.showmode = false -- Hide the mode text (e.g., -- INSERT --)
opt.cursorline = true -- Show which line your cursor is on
opt.scrolloff = 5 -- Minimal number of screen lines to keep above/below cursor
opt.signcolumn = 'yes' -- Keep signcolumn on by default
opt.splitright = true -- Configure how new splits should be opened
opt.splitbelow = true
opt.inccommand = 'split' -- Preview substitutions live
opt.hlsearch = true -- Set highlight on search

-- [[ Performance ]]
opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 300 -- Time to wait for a mapped sequence

-- [[ Tabs & Indentation ]]
o.tabstop = 4 -- Number of spaces tabs count for
o.softtabstop = 4 -- Number of spaces inserted when hitting tab
o.shiftwidth = 4 -- Number of spaces for autoindent
opt.breakindent = true -- Enable break indent

-- [[ Search ]]
opt.ignorecase = true -- Case-insensitive searching
opt.smartcase = true -- Override ignorecase if search pattern has uppercase letters

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

