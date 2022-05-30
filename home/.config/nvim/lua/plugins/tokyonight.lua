local function config()
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_sidebars = { "NvimTree" }

  vim.cmd("colorscheme tokyonight")
end

return {
  "folke/tokyonight.nvim",
  config = config,
}
