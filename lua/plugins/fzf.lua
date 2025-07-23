return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    require('fzf-lua').setup {
      defaults = {
        git_icons = false,
        file_icons = false,
        color_icons = false,
      },
      winopts = {
        border = 'single',
        treesitter = 'true',
        preview = {
          border = 'single',
        },
      },
    }
  end,
}
