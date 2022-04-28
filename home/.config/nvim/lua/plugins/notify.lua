local function config()
  local notify = require("notify")
  notify.setup()
end

return {
  "rcarriga/nvim-notify",
  config=config,
}
