local function config()
  local better_escape = require("better_escape")
  better_escape.setup({
    mapping = {"jk", "jj"},
  })
end

return {
  "max397574/better-escape.nvim",
  config=config
}
