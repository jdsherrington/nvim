-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap -- Alias for vim.keymap

-- [[ General Keymaps ]]

-- Clear search highlights
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear Search Highlight' })

-- Diagnostic keymaps (These are fine here as they use core vim.diagnostic)
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal mode exit
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- fzf-lua keymappings
keymap.set('n', '<leader><space>', function()
  require('fzf-lua').git_files()
end, { desc = 'fzf Git Files' })

keymap.set('n', '<leader>/', function()
  require('fzf-lua').live_grep_native()
end, { desc = 'fzf Grep' })

keymap.set('n', '<leader>s', function()
  require('fzf-lua').spell_suggest { winopts = { relative = 'cursor', row = 1.01, col = 0, height = 0.2, width = 0.2 } }
end, { desc = 'fzf Spellcheck' })

-- NOTE: The <C-h/j/k/l> window navigation keymaps are now handled by
-- the vim-tmux-navigator plugin configuration in lua/plugins/tmux-nav.lua
-- If you want *Neovim-only* window navigation without tmux integration,
-- you could add these back here and potentially remove/disable vim-tmux-navigator.
-- keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
