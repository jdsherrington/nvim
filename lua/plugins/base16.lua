-- ~/.config/nvim/lua/plugins/base16.lua
return {
  'chriskempson/base16-vim',
  lazy = false, -- Load theme early
  priority = 1000, -- Ensure theme loads before other plugins that depend on highlights
  config = function()
    -- Set the initial colorscheme
    vim.cmd.colorscheme 'base16-default-dark'

    -- Function to apply custom highlights
    local function apply_custom_highlights()
      vim.cmd 'highlight Normal ctermbg=NONE guibg=NONE'
      vim.cmd 'highlight EndOfBuffer ctermbg=NONE guibg=NONE'
      -- Use pcall for safety, but consider removing temporarily for debugging
      local function set_hl(group, config)
        pcall(vim.api.nvim_set_hl, 0, group, config)
      end

      -- Focus on cterm attributes since termguicolors = false
      -- Verify these cterm numbers correspond to the desired colors in your terminal
      set_hl('MiniStatuslineModeNormal', { cterm = { bold = true }, ctermbg = 8, ctermfg = 15 }) -- bg=gray, fg=white
      set_hl('MiniStatuslineModeInsert', { cterm = { bold = true }, ctermbg = 4, ctermfg = 15 }) -- bg=blue, fg=white
      set_hl('MiniStatuslineModeVisual', { cterm = { bold = true }, ctermbg = 5, ctermfg = 0 }) -- bg=magenta, fg=black
      set_hl('MiniStatuslineModeReplace', { cterm = { bold = true }, ctermbg = 1, ctermfg = 15 }) -- bg=red, fg=white (ctermbg=1 is often red)
      set_hl('MiniStatuslineModeCommand', { cterm = { bold = true }, ctermbg = 3, ctermfg = 0 }) -- bg=yellow, fg=black
      set_hl('Visual', { ctermfg = 15, ctermbg = 8 }) -- fg=white, bg=gray
      set_hl('Search', { ctermfg = 0, ctermbg = 4 }) -- fg=black, bg=blue
      set_hl('CurSearch', { ctermfg = 8, ctermbg = 3 }) -- fg=gray, bg=yellow
      set_hl('IncSearch', { ctermfg = 0, ctermbg = 2 }) -- fg=black, bg=green
      set_hl('StatusLine', { ctermfg = 7 }) -- fg=white (light gray)
      set_hl('StatusLineNC', { ctermfg = 8 }) -- fg=gray
      set_hl('CursorLine', { ctermbg = 0 }) -- bg=black (or another dark color like 235)
      set_hl('LineNr', { ctermfg = 8 }) -- fg=gray
      set_hl('CursorLineNr', { ctermfg = 3 }) -- fg=yellow
      set_hl('SnacksIndent', { ctermfg = 0 }) -- fg=black (Ensure 'SnacksIndent' exists)
      set_hl('GitGutterAdd', { ctermfg = 2 }) -- fg=green
      set_hl('GitGutterChange', { ctermfg = 4 }) -- fg=blue
      set_hl('GitGutterDelete', { ctermfg = 1 }) -- fg=red
      set_hl('GitGutterChangeDelete', { ctermfg = 5 }) -- fg=magenta
      set_hl('DiffAdd', { ctermfg = 2 }) -- fg=green
      set_hl('DiffChange', { ctermfg = 4 }) -- fg=blue
      set_hl('DiffDelete', { ctermfg = 1 }) -- fg=red
      set_hl('DiffText', { ctermfg = 5 }) -- fg=magenta
      set_hl('Pmenu', { ctermfg = 7, ctermbg = 0 }) -- fg=white, bg=black
      set_hl('PmenuSel', { cterm = { underline = true, reverse = true }, ctermfg = 7, ctermbg = 8 }) -- fg=white, bg=gray

      -- You could add vim.notify("Applied custom highlights", vim.log.levels.INFO) here for debugging
    end

    -- Create an autocommand to apply custom highlights *after* any colorscheme loads
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*', -- Apply to any colorscheme change
      callback = apply_custom_highlights,
      desc = 'Apply custom highlights after colorscheme loads',
    })

    -- Apply highlights immediately as well, in case the ColorScheme event
    -- doesn't fire on initial load (though it usually does)
    apply_custom_highlights()
  end,
}
