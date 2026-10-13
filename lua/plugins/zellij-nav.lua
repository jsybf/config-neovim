vim.pack.add { 'https://github.com/swaits/zellij-nav.nvim' }
require('zellij-nav').setup{}

vim.keymap.set('n', '<A-h>', '<cmd>ZellijNavigateLeftTab<cr>', { desc = 'Move focus left' })
vim.keymap.set('n', '<A-j>', '<cmd>ZellijNavigateDown<cr>', { desc = 'Move focus down' })
vim.keymap.set('n', '<A-k>', '<cmd>ZellijNavigateUp<cr>', { desc = 'Move focus up' })
vim.keymap.set('n', '<A-l>', '<cmd>ZellijNavigateRightTab<cr>', { desc = 'Move focus right' })
