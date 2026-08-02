vim.pack.add({
    { src = 'https://github.com/e-q/okcolors.nvim', name = 'okcolors' }
})

require('okcolors').setup({
    variant = 'smooth', -- 'smooth' or 'sharp', defaults to 'smooth'
})
vim.cmd.colorscheme('okcolors')
