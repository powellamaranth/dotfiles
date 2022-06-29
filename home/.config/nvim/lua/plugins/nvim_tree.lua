local function config()
  require("nvim-tree").setup({
    view = {
      side = "left",
      width = 25,
    },
  })

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<leader>]", ":lua require'nvim-tree'.toggle(false,true)<cr>", opts)
end

return {
  "kyazdani42/nvim-tree.lua",
  config = config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
