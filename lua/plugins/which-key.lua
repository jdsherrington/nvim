-- ~/.config/nvim/lua/plugins/which-key.lua
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- your which-key config options here
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}

