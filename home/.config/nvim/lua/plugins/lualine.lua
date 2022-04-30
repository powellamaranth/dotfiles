local function config()
  local lualine = require("lualine")
  lualine.setup({
    options = {
      theme = "nightfox",
      globalstatus = true,
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {"branch", "diff", "diagnostics"},
      lualine_c = {"filename"},
      lualine_x = {},
      lualine_y = {"encoding", "fileformat", "filetype"},
      lualine_z = {"location"}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {"filename"},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {"location"},
    },
    extensions = {"quickfix", "nvim-tree"},
  })
end

return {
  "nvim-lualine/lualine.nvim",
  config = config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
