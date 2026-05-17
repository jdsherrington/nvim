require('mason').setup({
  ui = {
    border = 'single',
  },
})

if #vim.api.nvim_list_uis() == 0 then
  return
end

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'html',
    'cssls',
    'tailwindcss',
    'pyright',
  },
  automatic_enable = false,
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'stylua',
    'prettierd',
    'ruff',
    'nixfmt',
  },
  run_on_start = true,
  start_delay = 3000,
  debounce_hours = 24,
})
