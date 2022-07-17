-- Disable making a backup file
vim.opt.backup = false

-- Number of screen lines to use for the command line
vim.opt.cmdheight = 1

-- Fix for the indentline problem
vim.opt.colorcolumn = "99999"

-- Options for insert mode completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Show text normally
vim.opt.conceallevel = 0

-- Enable the use of space in tab
vim.opt.expandtab = true

-- File content encoding for the buffer
vim.opt.fileencoding = "utf-8"

-- Disable `~` on nonexistent lines
vim.opt.fillchars = {
  fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  horiz = "━", -- BOX DRAWINGS HEAVY HORIZONTAL (U+2501, UTF-8: E2 94 81)
  horizdown = "┳", -- BOX DRAWINGS HEAVY DOWN AND HORIZONTAL (U+2533, UTF-8: E2 94 B3)
  horizup = "┻", -- BOX DRAWINGS HEAVY UP AND HORIZONTAL (U+253B, UTF-8: E2 94 BB)
  vert = "┃", -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  vertleft = "┫", -- BOX DRAWINGS HEAVY VERTICAL AND LEFT (U+252B, UTF-8: E2 94 AB)
  vertright = "┣", -- BOX DRAWINGS HEAVY VERTICAL AND RIGHT (U+2523, UTF-8: E2 94 A3)
  verthoriz = "╋", -- BOX DRAWINGS HEAVY VERTICAL AND HORIZONTAL (U+254B, UTF-8: E2 95 8B)
}

-- Enable cursor line
vim.opt.cursorline = false

-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- Ignore unsaved buffers
vim.opt.hidden = true

-- Highlight all the matches of search pattern
vim.opt.hlsearch = true

-- Case insensitive searching
vim.opt.ignorecase = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Show numberline
vim.opt.number = true

-- Number of space inserted for indentation
vim.opt.shiftwidth = 2

-- Disable showing modes in command line
vim.opt.showmode = false

-- Always show the sign column
vim.opt.signcolumn = "yes"

-- Case sensitivie searching
vim.opt.smartcase = true

-- Do auto indenting when starting a new line
vim.opt.smartindent = true

-- Disable spelling checking and highlighting
vim.opt.spell = false

-- Support US english
vim.opt.spelllang = "en"

-- Splitting a new window below the current one
vim.opt.splitbelow = true

-- Splitting a new window at the right of the current one
vim.opt.splitright = true

-- Disable use of swapfile for the buffer
vim.opt.swapfile = false

-- Number of space in a tab
vim.opt.tabstop = 2

-- Enable 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Enable persistent undo
vim.opt.undofile = true

-- Disable wrapping of lines longer than the width of window
vim.opt.wrap = false

-- Disable making a backup before overwriting a file
vim.opt.writebackup = false

-- Disable nvim intro
vim.opt.shortmess:append("sI")

-- Global status line
vim.opt.laststatus = 3

-- Use filetype.lua
vim.g.do_filetype_lua = 1

-- Disable builtin plugins
vim.g.loaded_2html_plugin = true
vim.g.loaded_getscript = true
vim.g.loaded_getscriptPlugin = true
vim.g.loaded_gzip = true
vim.g.loaded_logipat = true
vim.g.loaded_netrwFileHandlers = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwSettngs = true
vim.g.loaded_remote_plugins = true
vim.g.loaded_tar = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zip = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_vimball = true
vim.g.loaded_vimballPlugin = true
vim.g.zipPlugin = true
