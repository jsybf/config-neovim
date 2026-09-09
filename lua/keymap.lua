local function basic_keymap_arg(desc)
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

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-keymap', { clear = true }),
    callback = function(args)
        local function lsp_keymap_arg(desc)
            return { silent = true, noremap = true, desc = desc, buffer =  args.buf }
        end
        vim.keymap.set('n', '<leader>gg', telescope_builtin.lsp_definitions, lsp_keymap_arg('telescope lsp_definitons'))
        vim.keymap.set('n', '<leader>gr', telescope_builtin.lsp_references, lsp_keymap_arg('telescope lsp_references'))
        vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, lsp_keymap_arg('telescope diagnostics'))
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp_keymap_arg('goto definition'))
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, lsp_keymap_arg('goto declaration'))
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lsp_keymap_arg('goto implementation'))
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, lsp_keymap_arg('goto references'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, lsp_keymap_arg('lsp hover'))
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, lsp_keymap_arg('lsp rename'))
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, lsp_keymap_arg('lsp code_action'))
  end,
})

-- yazi
vim.keymap.set("n", "<leader>-", function() require("yazi").yazi() end,{ silent = true, desc = 'yazi' })
vim.keymap.set("n", "<leader>G", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })

-- aerial
vim.keymap.set("n", "<F2>", "<cmd>AerialToggle! right<CR>",basic_keymap_arg('toggle aerial'))



