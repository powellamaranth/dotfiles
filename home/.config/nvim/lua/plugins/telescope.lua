local function config()
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("notify")
  require("telescope").setup({})
end

return {
  "nvim-telescope/telescope.nvim",
  config = config,
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  },
}
