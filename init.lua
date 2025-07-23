-- ~/.config/nvim/init.lua

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Load Core Configuration ]]
require 'core.autocmds'
require 'core.options'
require 'core.keymaps'

require('lazy').setup {
  spec = {
    { import = 'plugins' },
  },
  ui = {
    border = 'single',
  },
  -- Configure any other lazy options here (performance, UI, etc.)
  -- For example:
  -- checker = { enabled = true, notify = false }, -- Check for updates daily
  -- performance = {
  --   rtp = {
  --     -- disable some rtp plugins
  --     disabled_plugins = {
  --       "gzip",
  --       "matchit",
  --       "matchparen",
  --       "netrwPlugin",
  --       "tarPlugin",
  --       "tohtml",
  --       "tutor",
  --       "zipPlugin",
  --     },
  --   },
  -- },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
