local function config()
  local telescope = require("telescope")
  telescope.load_extension("fzf")
  telescope.load_extension("notify")
  telescope.setup()
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  module = "telescope",
  config = config,
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make"},
  },
}
