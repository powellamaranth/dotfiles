local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
