-- Basic Neovim settings
local opt = vim.opt

-- Appearance
opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Relative line numbering
opt.cursorline = true       -- Highlight current line
opt.termguicolors = true    -- Support 24-bit colors
opt.signcolumn = "yes"      -- Always show sign column

-- Tabs and indentation
opt.tabstop = 4             -- Tab size
opt.shiftwidth = 4          -- Indent size
opt.expandtab = true        -- Use spaces instead of tabs
opt.autoindent = true       -- Automatic indentation
opt.smartindent = true      -- Smart indentation

-- Search
opt.ignorecase = true       -- Ignore case when searching
opt.smartcase = true        -- Consider case if uppercase letters present
opt.hlsearch = true         -- Highlight search results
opt.incsearch = true        -- Incremental search

-- Buffers and files
opt.hidden = true           -- Allow hidden buffers
opt.backup = false          -- Don't create backup files
opt.swapfile = false        -- Don't create swap files
opt.undofile = true         -- Save undo history

-- Miscellaneous
opt.mouse = "a"             -- Mouse support
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.splitbelow = true       -- New windows below
opt.splitright = true       -- New windows to the right
opt.wrap = false            -- Don't wrap lines
opt.scrolloff = 8           -- Scroll offset from edge
opt.sidescrolloff = 8       -- Side scroll offset

-- Update time
opt.updatetime = 300
opt.timeoutlen = 500

