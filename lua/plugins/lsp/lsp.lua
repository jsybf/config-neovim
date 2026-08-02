require('plugins.lsp.lua-language-server')
require('plugins.lsp.tinymist')
require('plugins.lsp.fish-lsp')

vim.lsp.enable('lua-language-server')
vim.lsp.enable('tinymist')
vim.lsp.enable('fish-lsp')

-- local bufmap = function(mode, lhs, rhs)
-- 	local opts = { buffer = event.buf }
-- 	vim.keymap.set(mode, lhs, rhs, opts)
-- end
-- bufmap('n', 'gd', vim.lsp.buf.definition)
-- bufmap('n', 'gD', vim.lsp.buf.declaration)
-- bufmap('n', 'gi', vim.lsp.buf.implementation)
-- bufmap('n', 'go', vim.lsp.buf.type_definition)
-- bufmap('n', 'gr', vim.lsp.buf.references)
-- bufmap('n', 'K', vim.lsp.buf.hover)
-- bufmap('n', '<C-k>', vim.lsp.buf.signature_help)
-- bufmap('n', '<F2>', vim.lsp.buf.rename)
-- bufmap('n', '<F3>', vim.lsp.buf.format)
-- bufmap('n', '<F4>', vim.lsp.buf.code_action)
--
--
