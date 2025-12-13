require "nvchad.options"

-- Disable luarocks (not needed for our plugins)
vim.g.loaded_rocks = 1

-- Add your custom options here
local o = vim.o

-- Show relative line numbers
o.relativenumber = true

-- Enable cursorline
o.cursorline = true
o.cursorlineopt = 'both'
