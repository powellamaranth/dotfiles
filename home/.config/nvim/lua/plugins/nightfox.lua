local function config()
  local nightfox = require("nightfox")

  vim.cmd("colorscheme nightfox")
  nightfox.setup({})
end

return {
  "EdenEast/nightfox.nvim",
  config=config,
}
