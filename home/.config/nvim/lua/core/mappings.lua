local keymap = vim.keymap.set
local silent = { silent = true }

-- Remap space as leader key
keymap("", "<space>", "<nop>", silent)
vim.g.mapleader = " "

-- NvimTree
keymap("n", "<c-n>", "NvimTreeToggle", silent)

-- Telescope
keymap("n", "<c-o>", "<cmd>Telescope live_grep<cr>", silent)
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>", silent)

-- TmuxNavigator
keymap("n", "<m-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", silent)
keymap("n", "<m-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", silent)
keymap("n", "<m-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", silent)
keymap("n", "<m-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", silent)
keymap("n", "<m-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", silent)
keymap("n", "<m-space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", silent)
