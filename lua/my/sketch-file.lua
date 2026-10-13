---@class MySketch
local M = {}

---Get and validate the sketch directory path from $NVIM_MY_SKETCH_PATH.
---@return string|nil dir Absolute path to the sketch directory, or nil if invalid.
local function get_sketch_dir()
  local dir = vim.env.NVIM_MY_SKETCH_PATH
  if not dir or dir == '' then
    vim.notify('$NVIM_MY_SKETCH_PATH is not set', vim.log.levels.ERROR, { title = 'Sketch' })
    return nil
  end

  if vim.fn.isdirectory(dir) == 0 then
    vim.notify('$NVIM_MY_SKETCH_PATH does not exist: ' .. dir, vim.log.levels.ERROR, { title = 'Sketch' })
    return nil
  end

  return dir
end

---Open a new sketch file for today with the next available index (max_idx + 1).
---Format: YYYY-MM-DD-xxx.md
---@return nil
function M.open_sketch()
  local dir = get_sketch_dir()
  if not dir then
    return
  end

  local date = os.date('%Y-%m-%d')
  local pattern = '^' .. vim.pesc(date) .. '%-(%d%d%d)%.md$'
  local max_idx = 0

  for name, type in vim.fs.dir(dir) do
    if type == 'file' then
      local idx_str = name:match(pattern)
      if idx_str then
        local idx = tonumber(idx_str)
        if idx and idx > max_idx then
          max_idx = idx
        end
      end
    end
  end

  if max_idx >= 999 then
    vim.notify('Daily sketch limit (999) reached', vim.log.levels.ERROR, { title = 'Sketch' })
    return
  end

  local next_filepath = string.format('%s/%s-%03d.md', dir, date, max_idx + 1)
  vim.cmd.edit(next_filepath)
end

---Search file contents across all sketches using Telescope live_grep.
---@return nil
function M.find_in_sketches()
  local dir = get_sketch_dir()
  if not dir then
    return
  end

  require('telescope.builtin').live_grep({
    prompt_title = 'Find in Sketches',
    cwd = dir,
  })
end

---List all sketch files using Telescope find_files.
---@return nil
function M.list_sketches()
  local dir = get_sketch_dir()
  if not dir then
    return
  end

  require('telescope.builtin').find_files({
    prompt_title = 'Current Sketches',
    cwd = dir,
  })
end

return M
