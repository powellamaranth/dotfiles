local function config()
  vim.o.termguicolors = true
  vim.cmd([[colorscheme dracula]])
end

return {
  "dracula/vim",
  config = config,
}
