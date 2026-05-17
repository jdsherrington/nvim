local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })

map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic float' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic list' })

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<leader><space>', function()
  require('plugins.search').fzf().files()
end, { desc = 'Find files' })

map('n', '<leader>/', function()
  require('plugins.search').fzf().live_grep()
end, { desc = 'Live grep' })

map('n', '<leader>fb', function()
  require('plugins.search').fzf().buffers()
end, { desc = 'Buffers' })

map('n', '<leader>fh', function()
  require('plugins.search').fzf().helptags()
end, { desc = 'Help tags' })
