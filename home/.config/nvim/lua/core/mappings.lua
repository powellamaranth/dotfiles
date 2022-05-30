local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "

-- NvimTree
keymap("n", "<c-n>", "NvimTreeToggle", opts)

-- Telescope
keymap("n", "<c-o>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>", opts)

-- TmuxNavigator
keymap("n", "<m-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", opts)
keymap("n", "<m-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", opts)
keymap("n", "<m-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", opts)
keymap("n", "<m-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", opts)
keymap("n", "<m-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", opts)
keymap("n", "<m-space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", opts)
