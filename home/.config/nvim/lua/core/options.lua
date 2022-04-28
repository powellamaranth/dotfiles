local g = vim.g
local o = vim.opt

-- Space as leader key
g.mapleader = " "

-- Don't use filetype.vim
g.did_load_filetypes = 0

-- Use filetype.lua
g.do_filetype_lua = 1

-- Disable making a backup file
o.backup = false

-- Number of screen lines to use for the command line
o.cmdheight = 1

-- Fix for the indentline problem
o.colorcolumn = "99999"

-- Options for insert mode completion
o.completeopt = { "menuone", "noselect" }

-- Show text normally
o.conceallevel = 0

-- Highlight the text line of the cursor
o.cursorline = true

-- Enable the use of space in tab
o.expandtab = true

-- File content encoding for the buffer
o.fileencoding = "utf-8"

-- Disable `~` on nonexistent lines
o.fillchars = { eob = " " }

-- Create folds manually
o.foldmethod = "manual"

-- Ignore unsaved buffers
o.hidden = true

-- Highlight all the matches of search pattern
o.hlsearch = true

-- Case insensitive searching
o.ignorecase = true

-- Enable mouse support
o.mouse = "a"

-- Show numberline
o.number = true

-- Show relative numberline
o.relativenumber = true

-- Number of space inserted for indentation
o.shiftwidth = 2

-- Disable showing modes in command line
o.showmode = false

-- Always show the sign column
o.signcolumn = "yes"

-- Case sensitivie searching
o.smartcase = true

-- Do auto indenting when starting a new line
o.smartindent = true

-- Disable spelling checking and highlighting
o.spell = false

-- Support US english
o.spelllang = "en"

-- Splitting a new window below the current one
o.splitbelow = true

-- Splitting a new window at the right of the current one
o.splitright = true

-- Disable use of swapfile for the buffer
o.swapfile = false

-- Number of space in a tab
o.tabstop = 2

-- Enable 24-bit RGB color in the TUI
o.termguicolors = true

-- Enable persistent undo
o.undofile = true

-- Disable wrapping of lines longer than the width of window
o.wrap = false

-- Disable making a backup before overwriting a file
o.writebackup = false
