-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' }, -- Load early for LSP
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    -- nvim-cmp related LSP dependencies are managed by blink.cmp
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Define the on_attach function for LSP specific keymaps and settings
    local on_attach = function(client, bufnr)
      -- NOTE: Remember that lua is a real programming language... (keep your comment)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
      end

      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      -- NOTE: gd for definition is handled by snacks.nvim / telescope usually

      -- Document Highlight
      if client and client.server_capabilities.documentHighlightProvider then
        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })
      end

      -- Add any other on_attach logic here
    end

    -- Setup mason
    mason.setup()

    -- Define servers and ensure they are installed
    local servers = {
      -- Add new servers here
      html = {},
      cssls = {},
      tailwindcss = {},
      ['typescript-language-server'] = {},
      pyright = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'html',
        'cssls',
        'tailwindcss',
        'typescript-language-server',
        'pyright',
        'lua_ls',
        'stylua', -- Formatter for Lua
        'prettierd', -- Formatter for web (JS, TS, CSS, HTML)
        'ruff', -- Formatter & Linter for Python
        -- Add other tools like linters, debuggers here
      },
    }

    -- Setup mason-lspconfig to bridge mason and lspconfig
    mason_lspconfig.setup {
      handlers = {
        -- Default handler: Sets up LSP server with lspconfig
        function(server_name)
          local server_opts = servers[server_name] or {}
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_opts.capabilities or {}),
            settings = server_opts.settings,
            cmd = server_opts.cmd,
            filetypes = server_opts.filetypes,
          }
        end,
        -- You can add custom handlers for specific servers here if needed
        -- ["lua_ls"] = function() ... end,
      },
    }
  end,
}
