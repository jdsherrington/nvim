-- ~/.config/nvim/lua/plugins/mini.lua
return {
  'echasnovski/mini.nvim',
  version = '*', -- Pin to latest release on setup
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()

    -- Setup statusline first
    local statusline = require 'mini.statusline'
    statusline.setup() -- Use default setup initially

    -- Then, safely modify its sections if MiniStatusline global exists
    if MiniStatusline and MiniStatusline.section_location then
      MiniStatusline.section_location = function()
        return '%2l:%-2v'
      end
    end

    if MiniStatusline and MiniStatusline.section_mode then
      local default_section_mode = MiniStatusline.section_mode
      MiniStatusline.section_mode = function(args)
        local mode, hl = default_section_mode(args)
        -- Ensure mode is a string before calling upper()
        if type(mode) == 'string' then
          return mode:upper(), hl
        end
        return mode, hl -- Return original if not a string
      end
    end
  end,
}
