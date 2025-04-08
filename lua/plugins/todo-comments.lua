-- ~/.config/nvim/lua/plugins/todo-comments.lua
return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
  event = 'VeryLazy',
  -- Keys are defined in snacks.lua, keep them there if using Snacks picker
  -- If not using Snacks picker, define keys here:
  -- keys = {
  --   { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
  --   { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
  --   { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
  -- },
}
