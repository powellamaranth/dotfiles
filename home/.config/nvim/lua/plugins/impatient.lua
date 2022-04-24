local function config()
  require("impatient").enable_profile()
end

return {
  "lewis6991/impatient.nvim",
  config = config,
}
