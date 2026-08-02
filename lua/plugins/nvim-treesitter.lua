vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require('nvim-treesitter').install { 'fish' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'fish' },
  callback = function() vim.treesitter.start() end,
})
