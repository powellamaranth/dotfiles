local function config()
  local impatient = require("impatient")
  impatient.enable_profile()
end

return {
  "lewis6991/impatient.nvim",
  config = config,
}
