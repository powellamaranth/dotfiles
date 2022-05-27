local g = vim.g
local o = vim.opt

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

-- Enable the use of space in tab
o.expandtab = true

-- File content encoding for the buffer
o.fileencoding = "utf-8"

-- Disable `~` on nonexistent lines
o.fillchars = {
  fold = "·",      -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  horiz = "━",     -- BOX DRAWINGS HEAVY HORIZONTAL (U+2501, UTF-8: E2 94 81)
  horizdown = "┳", -- BOX DRAWINGS HEAVY DOWN AND HORIZONTAL (U+2533, UTF-8: E2 94 B3)
  horizup = "┻",   -- BOX DRAWINGS HEAVY UP AND HORIZONTAL (U+253B, UTF-8: E2 94 BB)
  vert = "┃",      -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  vertleft = "┫",  -- BOX DRAWINGS HEAVY VERTICAL AND LEFT (U+252B, UTF-8: E2 94 AB)
  vertright = "┣", -- BOX DRAWINGS HEAVY VERTICAL AND RIGHT (U+2523, UTF-8: E2 94 A3)
  verthoriz = "╋", -- BOX DRAWINGS HEAVY VERTICAL AND HORIZONTAL (U+254B, UTF-8: E2 95 8B)
}

-- Treesitter folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99

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
-- o.relativenumber = true

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

-- Disable nvim intro
o.shortmess:append "sI"

-- Global status line
o.laststatus = 3

-- Don't use filetype.vim
g.did_load_filetypes = 0

-- Use filetype.lua
g.do_filetype_lua = 1

-- Disable builtin plugins
g.loaded_2html_plugin = true
g.loaded_getscript = true
g.loaded_getscriptPlugin = true
g.loaded_gzip = true
g.loaded_logipat = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwPlugin = true
g.loaded_netrwSettngs = true
g.loaded_remote_plugins = true
g.loaded_tar = true
g.loaded_tarPlugin = true
g.loaded_zip = true
g.loaded_zipPlugin = true
g.loaded_vimball = true
g.loaded_vimballPlugin = true
g.zipPlugin = true
