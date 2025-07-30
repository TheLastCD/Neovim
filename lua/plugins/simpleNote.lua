local api = vim.api

local function save_and_close(buf, win, note_path)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local f = io.open(note_path, "w")  -- change to "a" if you want append instead
  if f then
    f:write("- ")
    for _, line in ipairs(lines) do
      f:write(line .. "\n")
    end
    f:close()
    print("Note saved to " .. note_path)
  else
    print("Failed to write note!")
  end
  vim.api.nvim_win_close(win, true)
end


local function file_exists(path)
  local f = io.open(path, "r")
  if f then io.close(f) return true else return false end
end

local function read_file_lines(path)
  local lines = {}
  local f = io.open(path, "r")
  if f then
    for line in f:lines() do
      table.insert(lines, line)
    end
    f:close()
  end
  return lines
end

local function open_note_popup()
  local buf = api.nvim_create_buf(false, true)  -- unlisted, scratch buffer
  local width = math.floor(vim.o.columns * 0.6)
  local height = math.floor(vim.o.lines * 0.4)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
  })
  vim.bo[buf].filetype = 'markdown'

  -- Load existing notes if file exists
  local note_path = vim.fn.stdpath("data") .. "/notes.md"
  if file_exists(note_path) then
    local lines = read_file_lines(note_path)
    api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  end
  local keys = { "q", "Q", "<Esc>" }

  local opts = { noremap = true, silent = true }

  for _, key in ipairs(keys) do
    vim.keymap.set('n', key, function()
      save_and_close(buf, win, note_path)
    end, opts)
  end


  -- Map <leader>w to save notes
  api.nvim_buf_set_keymap(buf, 'n', '<leader>w', ':WriteNote<CR>', { noremap = true, silent = true })
end

vim.api.nvim_create_user_command("NotePopup", open_note_popup, {})
