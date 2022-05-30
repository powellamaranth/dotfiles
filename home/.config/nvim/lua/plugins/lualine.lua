local function config()
  require("lualine").setup({
    options = {
      theme = "tokyonight",
      globalstatus = true,
    },
    extensions = { "quickfix", "nvim-tree" },
  })
end

return {
  "nvim-lualine/lualine.nvim",
  config = config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}
