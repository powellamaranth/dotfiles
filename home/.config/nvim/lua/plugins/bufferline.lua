local function config()
  local bufferline = require("bufferline")
  bufferline.setup({
    options = {
      indicator_icon = '❚',
      show_tab_indicators = true,
      always_show_bufferline = true,
      separator_style = "thick",
      show_close_icon = false,
      offsets = {
        { filetype = "NvimTree", text = "" },
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
