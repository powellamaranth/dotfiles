local function config()
  require("nvim-tmux-navigation").setup({})
end

return {
  "alexghergh/nvim-tmux-navigation",
  config = config,
}
