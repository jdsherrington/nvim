vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('jds-lsp-attach', { clear = true }),
  callback = function(event)
    local bufnr = event.buf

    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, {
        buffer = bufnr,
        desc = 'LSP: ' .. desc,
      })
    end

    map('K', vim.lsp.buf.hover, 'Hover')
    map('gd', vim.lsp.buf.definition, 'Definition')
    map('gD', vim.lsp.buf.declaration, 'Declaration')
    map('gr', vim.lsp.buf.references, 'References')
    map('gi', vim.lsp.buf.implementation, 'Implementation')
    map('<leader>rn', vim.lsp.buf.rename, 'Rename')
    map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'single',
  },
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

for _, server in ipairs({
  'lua_ls',
  'nixd',
  'ts_ls',
  'html',
  'cssls',
  'tailwindcss',
  'pyright',
}) do
  vim.lsp.config(server, {
    capabilities = capabilities,
  })
end

vim.lsp.enable({
  'lua_ls',
  'nixd',
  'ts_ls',
  'html',
  'cssls',
  'tailwindcss',
  'pyright',
})
