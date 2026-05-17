local M = {}

local configured = false

function M.fzf()
  local fzf = require('fzf-lua')

  if not configured then
    fzf.setup({
      defaults = {
        git_icons = false,
        file_icons = false,
        color_icons = false,
      },

      winopts = {
        border = 'single',
        preview = {
          border = 'single',
        },
      },
    })

    configured = true
  end

  return fzf
end

return M
