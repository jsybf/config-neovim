
function basic_keymap_arg(desc)
    return { silent = true, noremap = true, desc = desc }
end
-- basic keymap
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>l', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':tabprev<CR>', { silent = true })
vim.keymap.set('n', '<C-s>', ':wa<CR>', { silent = true })
vim.keymap.set('n', '<leader>tt', ':tab new<CR>', {silent = true})
vim.keymap.set('n', '<leader>t', ':term<CR>', {silent = true})

-- nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { silent = true, desc = 'telescope find_files' })
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, { silent = true, desc = 'telescope live_grep' })
vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, { silent = true, desc = 'telescope buffers' })
vim.keymap.set('n', '<leader>sz', require('telescope').extensions.zoxide.list, { silent = true, desc = 'telescope zoxide' })
vim.keymap.set('n', '<leader>sp', require('telescope').extensions.project.project, { silent = true, desc = 'telescope project' })
vim.keymap.set( 'n', '<leader>/', telescope_builtin.current_buffer_fuzzy_find, { silent = true, desc = 'telescope project' })

-- lsp related
vim.keymap.set('n', '<leader>gg', telescope_builtin.lsp_definitions, { silent = true, desc = 'telescope lsp_definitons' })
vim.keymap.set('n', '<leader>gr', telescope_builtin.lsp_references, { silent = true, desc = 'telescope lsp_references' })
vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { silent = true, desc = 'telescope diagnostics' })

-- yazi
vim.keymap.set("n", "<leader>-", function() require("yazi").yazi() end,{ silent = true, desc = 'yazi' })
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })

-- aerial
vim.keymap.set("n", "<F2>", "<cmd>AerialToggle! right<CR>",basic_keymap_arg('toggle aerial'))

