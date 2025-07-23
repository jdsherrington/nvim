-- ~/.config/nvim/lua/plugins/sequence.lua
return {
  'jdsherrington/sequence',
  dir = '/Users/Jordan/Development/repos/sequence/nvim',
  name = 'sequence',
  lazy = false, -- Load immediately at startup (important for colorschemes)
  priority = 1000, -- High priority so it loads before other plugins
  opts = {
    transparent = true, -- If true, disables background color (for terminal transparency)
    dim_inactive = false, -- If true, dims inactive windows
    styles = {
      comments = { italic = true }, -- Style for comments (italic, bold, underline, etc.)
      keywords = { bold = false }, -- Style for keywords
      functions = { bold = false }, -- Style for function names
      strings = { italic = false }, -- Style for strings
    },
    integrations = {
      auto_detect = true, -- Automatically detect and enable highlights for installed plugins
    },
    debug = false, -- If true, prints debug info about loaded plugins and highlights
  },

  config = function(_, opts)
    require('sequence').setup(opts)
  end,
}
