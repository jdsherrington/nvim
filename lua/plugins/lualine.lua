local function filepath_with_git_root()
  local filepath = vim.fn.expand '%:p'
  if filepath == '' then
    return ''
  end

  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.fnameescape(vim.fn.expand '%:p:h') .. ' rev-parse --show-toplevel')[1]

  if git_root and git_root ~= '' then
    -- strip trailing slash
    git_root = vim.fn.fnamemodify(git_root, ':p'):gsub('/$', '')
    filepath = vim.fn.fnamemodify(filepath, ':p')

    local repo_name = vim.fn.fnamemodify(git_root, ':t')
    local git_icon = '' -- pick what you like: " ", " ", "git:" etc.

    if filepath:sub(1, #git_root) == git_root then
      local relpath = filepath:sub(#git_root + 2)
      if relpath == '' then
        return git_icon .. repo_name .. '/' .. vim.fn.fnamemodify(filepath, ':t')
      else
        return git_icon .. repo_name .. '/' .. relpath
      end
    end
  end

  -- Not a git repo → fall back
  return vim.fn.fnamemodify(filepath, ':~')
end

local function make_lualine_transparent()
  local groups = {
    'lualine_c_inactive',
    'lualine_c_insert',
    'lualine_c_command',
    'lualine_c_replace',
    'lualine_c_visual',
    'lualine_c_normal',
    'lualine_c_terminal',
    'lualine_c_tabline',
    'lualine_x_inactive',
    'lualine_x_insert',
    'lualine_x_command',
    'lualine_x_replace',
    'lualine_x_visual',
    'lualine_x_normal',
    'lualine_x_terminal',
    'lualine_x_tabline',
    'lualine_x_filetype_DevIconLua_normal',
    'lualine_x_filetype_DevIconLua_insert',
    'lualine_x_filetype_DevIconLua_visual',
    'lualine_x_filetype_DevIconLua_replace',
    'lualine_x_filetype_DevIconLua_command',
    'lualine_x_filetype_DevIconLua_terminal',
    'lualine_x_filetype_DevIconLua_inactive',
  }

  for _, group in ipairs(groups) do
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
    if ok and hl then
      local new_hl = {}
      for k, v in pairs(hl) do
        new_hl[k] = v
      end
      new_hl.bg = nil -- transparent
      vim.api.nvim_set_hl(0, group, new_hl)
    end
  end

  -- Get fg color from IncSearch
  local inc_ok, inc_hl = pcall(vim.api.nvim_get_hl, 0, { name = 'IncSearch' })
  local inc_fg = inc_ok and inc_hl and inc_hl.fg or nil

  -- Apply IncSearch fg to mode labels
  if inc_fg then
    local mode_groups = {
      'lualine_a_normal',
      'lualine_a_insert',
      'lualine_a_visual',
      'lualine_a_command',
      'lualine_a_replace',
      'lualine_a_terminal',
      'lualine_z_normal',
      'lualine_z_insert',
      'lualine_z_visual',
      'lualine_z_command',
      'lualine_z_replace',
      'lualine_z_terminal',
    }

    for _, group in ipairs(mode_groups) do
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
      if ok and hl then
        local new_hl = {}
        for k, v in pairs(hl) do
          new_hl[k] = v
        end
        new_hl.fg = inc_fg
        vim.api.nvim_set_hl(0, group, new_hl)
      end
    end
  end
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '::', right = '::' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16,
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics', 'searchcount', 'selectioncount' },
        lualine_c = {
          {
            filepath_with_git_root,
            cond = function()
              return vim.fn.expand '%:t' ~= ''
            end,
          },
        },
        lualine_x = { 'lsp_status', 'filesize' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }

    -- Run after everything is loaded
    local function delayed_apply()
      vim.defer_fn(make_lualine_transparent, 50) -- wait 50ms
    end

    -- Apply on startup and when colorscheme changes
    vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
      callback = delayed_apply,
    })
  end,
}
