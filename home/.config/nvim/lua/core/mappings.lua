local map = vim.keymap.set
local g = vim.g

-- Remap space as leader key
map("", "<Space>", "<Nop>")
g.mapleader = " "

map("n", "<leader>t", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
