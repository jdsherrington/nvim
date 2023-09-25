local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust_analyzer",
        "eslint-lsp",
        "typescript-language-server",
        "python-lsp-server",
        "html-lsp",
        "css-lsp",
        "sqlls",
      },
    },
  }
}
return plugins



