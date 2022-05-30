local function config()
  require("nvim-tree").setup({
    open_on_setup = true,
    view = {
      side = "left",
      width = 25,
    },
  })
end

return {
  "kyazdani42/nvim-tree.lua",
  config = config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
