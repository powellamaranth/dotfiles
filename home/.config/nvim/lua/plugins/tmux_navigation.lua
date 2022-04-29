local function config()
  local nav = require("nvim-tmux-navigation")
  nav.setup({
    disable_when_zoomed = true,
    keybindings = {
      left = "<M-Left>",
      down = "<M-Down>",
      up = "<M-Up>",
      right = "<M-Right>",
      last_active = "<M-0>",
    }
  })
end

return {
  "alexghergh/nvim-tmux-navigation",
  config=config,
}
