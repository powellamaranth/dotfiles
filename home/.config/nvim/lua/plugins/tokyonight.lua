local function config()
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_sidebars = { "NvimTree" }

  vim.cmd([[
    colorscheme tokyonight
    hi CursorLine gui=underline cterm=underline ctermbg=None guibg=None
  ]])
end

return {
  "folke/tokyonight.nvim",
  config = config,
}
