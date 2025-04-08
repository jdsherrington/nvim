-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' }, -- Load early for LSP
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    -- Add nvim-cmp related LSP dependencies here if not already handled by cmp plugin spec
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'
    local capabilities = cmp_nvim_lsp.default_capabilities()

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
      -- Add other servers like: clangd = {}, pyright = {}, tsserver = {}, etc.
    }

    local ensure_installed = vim.tbl_keys(servers)
    vim.list_extend(ensure_installed, {
      'stylua', -- Formatter
      'prettierd', -- Formatter
      -- Add other tools like linters, debuggers here
    })
    mason_tool_installer.setup { ensure_installed = ensure_installed }

    -- Setup mason-lspconfig to bridge mason and lspconfig
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers), -- Ensure only LSP servers listed above are managed
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

