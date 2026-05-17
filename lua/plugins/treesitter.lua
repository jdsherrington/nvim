local languages = {
  'bash',
  'html',
  'html_tags',
  'lua',
  'markdown',
  'vim',
  'vimdoc',
  'javascript',
  'typescript',
  'python',
  'nix',
}

require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

if #vim.api.nvim_list_uis() > 0 then
  require('nvim-treesitter').install(languages)
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('jds-treesitter', { clear = true }),
  pattern = languages,
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
