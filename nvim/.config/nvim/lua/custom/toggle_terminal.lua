local state = {
	floating = {
		buf = -1,
		win = -1, 
	}
}


local function create_window(opts)
	opts = opts or {}


	local buf = nil
	
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end
	local win_opts = {
		split = "left",
		win = 0,
	}

	vim.api.nvim_command('botright split') 
	vim.cmd.terminal()
	local new_win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(new_win, buf)
	vim.wo[new_win].number = false
	vim.wo[new_win].relativenumber = false

	vim.api.nvim_feedkeys("i", "n", false)
	vim.api.nvim_win_set_height(new_win, 12)
	return {buf = buf, win = new_win}
end

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal", -- No borders or extra UI elements
	border = "rounded" 
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

function ToggleTerminal()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end
