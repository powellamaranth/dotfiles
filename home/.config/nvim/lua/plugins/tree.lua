local function config()
  local tree = require("nvim-tree")
  tree.setup()
end

return {
  "kyazdani42/nvim-tree.lua",
  config=config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
