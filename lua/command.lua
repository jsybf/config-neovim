local wipe_hidden = require('my.wipe-hidden')
local sketch = require('my.sketch-file')

vim.api.nvim_create_user_command(
	'Wh',
	wipe_hidden.wipe_hidden_buf,
	{ nargs = 0 }
)

vim.api.nvim_create_user_command('Sketch', sketch.open_sketch, { nargs = 0 })
vim.api.nvim_create_user_command('SketchFind', sketch.find_in_sketches, { nargs = 0 })
vim.api.nvim_create_user_command('SketchCurrent', sketch.list_sketches, { nargs = 0 })
