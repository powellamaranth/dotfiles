local function config()
  require("nvim-tmux-navigation").setup({})

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<m-left>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", opts)
  keymap("n", "<m-down>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", opts)
  keymap("n", "<m-up>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", opts)
  keymap("n", "<m-right>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", opts)

  keymap("n", "<m-/>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", opts)
  keymap("n", "<m-space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", opts)
end

return {
  "alexghergh/nvim-tmux-navigation",
  config = config,
}
