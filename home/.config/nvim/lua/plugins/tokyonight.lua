local function config()
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_sidebars = { "NvimTree", "qf", "vista_kind", "terminal", "packer" }

  vim.cmd("colorscheme tokyonight")
end

return {
  "folke/tokyonight.nvim",
  config=config,
}
