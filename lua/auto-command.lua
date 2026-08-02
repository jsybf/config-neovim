
-- Events associated with TextChange
--     TextChangedI: after text change in insert mode
--     TextChanged: after text change in normal mode
--     TextChangedT: after text change in terminal mode
local autosave_timer = nil
local AUTOSAVE_INTERVAL_MS = 1000;
vim.api.nvim_create_autocmd(
	{ 'TextChanged', 'TextChangedI' },
	{
		pattern = '*',
		callback = function()
			if autosave_timer ~= nil then
				return
			end
			autosave_timer = vim.fn.timer_start(
				AUTOSAVE_INTERVAL_MS,
				function()
					if vim.bo.modified and vim.fn.expand('%') ~= "" and vim.bo.modifiable and not vim.bo.readonly then
						vim.cmd("silent! write")
					end
					autosave_timer = nil
				end
			)
		end
	}
)

vim.api.nvim_create_autocmd("TextYankPost",{
    desc = "Highlight when copying text",
    callback = function() vim.hl.on_yank() end,
})


-- automatically open TypstPreview when typst file opened
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function(args)
        -- only once for buffer
        if vim.b[args.buf].typst_preview_started then return end

        vim.b[args.buf].typst_preview_started = true

        vim.cmd("TypstPreview")

    end
})

-- automatically close TypstPreview when typst file closed
vim.api.nvim_create_autocmd({ "BufUnload", "BufDelete", "BufWipeout" }, {
  callback = function(args)
        if not vim.b[args.buf].typst_preview_started then return end
        vim.b[args.buf].typst_preview_started = false
        pcall(vim.api.nvim_buf_call, args.buf, function()
            vim.cmd("TypstPreviewStop")
        end)
  end,
})
