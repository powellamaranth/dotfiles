local function config()
  local neoscroll = require("neoscroll")
  neoscroll.setup()
end

return {
  "karb94/neoscroll.nvim",
  config = config,
}
