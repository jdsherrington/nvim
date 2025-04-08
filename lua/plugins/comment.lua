-- ~/.config/nvim/lua/plugins/comment.lua
return {
  'numToStr/Comment.nvim',
  opts = {},
  event = 'VeryLazy', -- Optional: Load lazily
  -- Optional: Define keys if you want them managed by lazy.nvim
  -- keys = {
  --   { "gc", mode = { "n", "v" }, desc = "Comment toggle" },
  -- },
}

