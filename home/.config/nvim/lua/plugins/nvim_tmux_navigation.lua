local function config()
  require"nvim-tmux-navigation".setup{
    disable_when_zoomed = true,
  }
end

return {
  "alexghergh/nvim-tmux-navigation",
  config=config,
}
