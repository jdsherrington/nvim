vim.pack.add({
  -- Tooling
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },

  -- Completion
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },

  -- Formatting
  { src = 'https://github.com/stevearc/conform.nvim' },

  -- Search
  { src = 'https://github.com/ibhagwan/fzf-lua' },

  -- Syntax
  { src = 'https://github.com/neovim-treesitter/treesitter-parser-registry' },
  { src = 'https://github.com/neovim-treesitter/nvim-treesitter', version = 'main' },

  -- Git
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },

  -- Icons
  { src = 'https://github.com/echasnovski/mini.icons' },
})

require 'plugins.mason'
require 'plugins.completion'
require 'plugins.format'
require 'plugins.search'
require 'plugins.treesitter'
require 'plugins.git'
