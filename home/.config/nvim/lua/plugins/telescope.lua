local function config()
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("notify")
  require("telescope").setup({})

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<leader>o", "<cmd>Telescope live_grep<cr>", opts)
  keymap("n", "<leader>p", "<cmd>Telescope find_files<cr>", opts)
end

return {
  "nvim-telescope/telescope.nvim",
  config = config,
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  },
}
