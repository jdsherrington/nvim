-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' }, -- Load early for highlighting/indent
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'astro', 'javascript', 'typescript', 'python', 'rust' }, -- Add more languages
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      -- Add other modules like textobjects, context, etc. if desired
      -- textobjects = { ... }
    }
  end,
}
