-- Key mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- Insert mode mappings
keymap("i", "jk", "<Esc>", opts)                      -- Exit insert mode
keymap("i", "kj", "<Esc>", opts)                      -- Alternative exit

-- Visual mode mappings  
keymap("v", "jk", "<Esc>", opts)                      -- Exit visual mode
keymap("v", "kj", "<Esc>", opts)                      -- Alternative exit

-- Command mode mappings
keymap("c", "jk", "<C-c>", { noremap = true })        -- Exit command mode
keymap("c", "kj", "<C-c>", { noremap = true })        -- Alternative exit

-- General
keymap("n", "<leader>w", ":w<CR>", opts)              -- Save
keymap("n", "<leader>q", ":q<CR>", opts)              -- Quit
keymap("n", "<leader>x", ":x<CR>", opts)              -- Save and quit

-- Buffer navigation
keymap("n", "<Tab>", ":bnext<CR>", opts)              -- Next buffer
keymap("n", "<S-Tab>", ":bprev<CR>", opts)            -- Previous buffer
keymap("n", "<leader>bd", ":bdelete<CR>", opts)       -- Close buffer

-- Window navigation (handled by tmux-navigator plugin)
-- keymap("n", "<C-h>", "<C-w>h", opts)              -- Left window (disabled)
-- keymap("n", "<C-j>", "<C-w>j", opts)              -- Bottom window (disabled)
-- keymap("n", "<C-k>", "<C-w>k", opts)              -- Top window (disabled)
-- keymap("n", "<C-l>", "<C-w>l", opts)              -- Right window (disabled)

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)            -- Move down
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)            -- Move up

-- Search
keymap("n", "<leader>hl", ":nohl<CR>", opts)          -- Clear search highlight

-- Visual mode indentation
keymap("v", "<", "<gv", opts)                         -- Decrease indent
keymap("v", ">", ">gv", opts)                         -- Increase indent

-- Terminal mappings
keymap("n", "<leader>th", ":split | terminal<CR>", opts)       -- Terminal horizontal (bottom)
keymap("n", "<leader>tv", ":vsplit | terminal<CR>", opts)      -- Terminal vertical (right)
keymap("n", "<leader>tt", ":tabnew | terminal<CR>", opts)      -- Terminal in new tab
keymap("n", "<leader>tf", ":lua OpenFloatingTerminal()<CR>", opts) -- Floating terminal

-- Terminal mode mappings
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)       -- Move left from terminal
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)       -- Move down from terminal  
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)       -- Move up from terminal
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)       -- Move right from terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)             -- Exit terminal mode with Esc
