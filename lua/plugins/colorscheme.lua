vim.pack.add({
    { src = 'https://github.com/e-q/okcolors.nvim', name = 'okcolors' },
    { src = "https://github.com/junegunn/seoul256.vim" },
})

require('okcolors').setup({
    variant = 'smooth', -- 'smooth' or 'sharp', defaults to 'smooth'
})
vim.cmd.colorscheme('okcolors')

-- vim.g.seoul256_light_background = 252
-- vim.cmd.colorscheme("seoul256-light")
