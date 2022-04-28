local function config()
  local bufferline = require("bufferline")
  bufferline.setup({
    options = {
      offsets = {
        {filetype = "NvimTree", text = "", padding = 1 },
      }
    }
  })
end

return {
  "akinsho/bufferline.nvim",
  config = config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
