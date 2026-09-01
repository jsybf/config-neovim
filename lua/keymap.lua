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

-- terminal keymap: yazi가 아닌 터미널 버퍼에만 jk 탈출 매핑
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('terminal-jk-escape', { clear = true }),
  callback = function(ev)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(ev.buf) then
        return
      end
      if vim.bo[ev.buf].filetype == 'yazi' or vim.api.nvim_buf_get_name(ev.buf):match('yazi') then
        return
      end
      vim.keymap.set('t', 'jk', '<C-\\><C-n>', { buffer = ev.buf, desc = 'terminalmode2normalmode', })
    end)
  end,
})

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
