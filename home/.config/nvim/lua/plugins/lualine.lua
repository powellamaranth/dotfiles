local function config()
  local lualine = require("lualine")
  lualine.setup({
    options = {
      theme = 'tokyonight'
    }
  })
end

return {
  "nvim-lualine/lualine.nvim",
  config = config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
