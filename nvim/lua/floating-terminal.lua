-- Floating terminal functionality
local M = {}

-- Function to create a floating terminal
function M.open_floating_terminal()
  -- Get editor dimensions
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  
  -- Calculate floating window size (80% of editor size)
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)
  
  -- Calculate starting position (centered)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)
  
  -- Create buffer for terminal
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Define window configuration
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
    title = " Terminal ",
    title_pos = "center",
  }
  
  -- Create floating window
  local win = vim.api.nvim_open_win(buf, true, opts)
  
  -- Set window options
  vim.api.nvim_win_set_option(win, "winblend", 10) -- Slight transparency
  
  -- Start terminal in the buffer
  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      -- Close window when terminal exits
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })
  
  -- Enter insert mode automatically
  vim.cmd("startinsert")
  
  -- Set buffer options
  vim.api.nvim_buf_set_option(buf, "filetype", "terminal")
  
  -- Add keymaps for easy closing
  local close_opts = { buffer = buf, silent = true }
  vim.keymap.set("n", "q", "<cmd>close<CR>", close_opts)
  vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", close_opts)
  vim.keymap.set("t", "<C-q>", "<C-\\><C-n><cmd>close<CR>", close_opts)
end

-- Global function for keymap
function OpenFloatingTerminal()
  M.open_floating_terminal()
end

return M
