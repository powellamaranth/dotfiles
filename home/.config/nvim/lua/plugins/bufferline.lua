local function config()
  local bufferline = require("bufferline")
  bufferline.setup({})
end

return {
  "akinsho/bufferline.nvim",
  config = config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
