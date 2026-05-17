require('conform').setup({
  notify_on_error = false,

  format_on_save = {
    timeout_ms = 1000,
    lsp_format = 'fallback',
  },

  formatters_by_ft = {
    lua = { 'stylua' },
    nix = { 'nixfmt' },

    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },

    json = { 'prettierd' },
    yaml = { 'prettierd' },
    markdown = { 'prettierd' },
    html = { 'prettierd' },
    css = { 'prettierd' },
    scss = { 'prettierd' },

    python = { 'ruff_format' },
  },
})
