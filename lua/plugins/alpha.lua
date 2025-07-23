-- ~/.config/nvim/lua/plugins/alpha.lua
return {
  'goolord/alpha-nvim',
  event = 'VimEnter', -- Load on startup
  dependencies = { 'echasnovski/mini.icons' }, -- Keep dependency if you might use icons elsewhere
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard' -- We still use this for the theme base

    -- Your ASCII logo
    local logo = {
      '       ▒▒    ▒███████    ▒███████           ',
      '      ████▒ ▓█████████░ ██████████          ',
      '      █████▓      ▓███████████              ',
      '       ▒█████▒     ▒███████████▒            ',
      ' ░░      █████▓    ▒█████▒       ██████     ',
      '████░     ▒█████░ ▓█████          ██████░   ',
      '███████████▓    ▒█████░ ████████████████▒   ',
      ' ▓███████████  ▒█████    ▒█████████████░    ',
    }

    -- Calculate dynamic vertical padding
    local padding_top = math.floor((vim.o.lines - #logo - 2) / 2) -- Keep padding calculation
    padding_top = math.max(padding_top, 1)

    -- Define a custom highlight group for the logo
    vim.api.nvim_set_hl(0, 'AlphaLogo', { ctermfg = 0, fg = '#1D222A', bold = true })

    -- *** Use the simpler layout structure from your original config ***
    dashboard.opts.layout = {
      { type = 'padding', val = padding_top },
      {
        type = 'text',
        val = logo,
        opts = {
          position = 'center',
          hl = 'AlphaLogo', -- Use the defined highlight
        },
      },
      { type = 'padding', val = 2 },
      -- No explicit buttons defined here, matching your original setup's behavior
    }

    -- Setup alpha with the modified dashboard options
    alpha.setup(dashboard.opts)

    -- *** Keep the Autocommand to handle creating the scratch buffer on 'i' ***
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'alpha',
      callback = function(args)
        -- Define the action *inside* the callback so it's local
        local function create_scratch_buffer()
          vim.cmd 'enew | setlocal buftype=nofile bufhidden=hide noswapfile | startinsert'
        end

        vim.opt_local.statuscolumn = ''

        -- Map 'i' in normal mode to create the scratch buffer for the alpha buffer
        vim.keymap.set('n', 'i', create_scratch_buffer, {
          buffer = args.buf,
          noremap = true,
          silent = true,
          desc = 'Create scratch buffer',
        })

        -- Ensure the alpha buffer itself remains non-modifiable and readonly
        vim.bo[args.buf].modifiable = false
        vim.bo[args.buf].readonly = true -- Setting readonly might be redundant if non-modifiable, but safe
      end,
      desc = 'Setup keymaps/options for alpha buffer',
    })

    vim.api.nvim_create_autocmd('WinEnter', {
      pattern = '*',
      callback = function()
        if vim.bo.filetype == 'alpha' then
          vim.wo.number = false
          vim.wo.relativenumber = false
        end
      end,
      desc = 'Hide line numbers in alpha buffer',
    })
  end,

  -- No need for the separate create_scratch_buffer function here anymore
}
