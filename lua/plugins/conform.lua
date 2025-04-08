-- ~/.config/nvim/lua/plugins/conform.lua
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- Run formatting just before saving
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' }, -- Add other filetypes
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      markdown = { 'prettierd' },
      html = { 'prettierd' },
      css = { 'prettierd' },
      scss = { 'prettierd' },
      astro = { 'prettierd' },
      -- python = { "isort", "black" },
    },
    formatters = {
      prettierd = {
        -- Your prettierd config function for astro
        args = function(self, ctx)
          if vim.endswith(ctx.filename, '.astro') then
            return {
              '--stdin-filepath',
              ctx.filename, -- Use ctx.filename directly
              '--plugin',
              'prettier-plugin-astro',
            }
          end
          return { '--stdin-filepath', ctx.filename } -- Use ctx.filename
        end,
      },
    },
  },
}

