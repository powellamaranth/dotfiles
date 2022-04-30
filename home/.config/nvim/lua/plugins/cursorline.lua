local function config()
  local cursorline = require("nvim-cursorline")
  cursorline.setup({
    cursorline = {
      enable = true,
      timeout = 200,
      number = true,
    },
    cursorword = {
      enable = false,
    },
  })
end

return {
  "yamatsum/nvim-cursorline",
  config = config,
}
