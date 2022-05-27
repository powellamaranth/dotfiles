local function config()
  require"notify".setup()
end

return {
  "rcarriga/nvim-notify",
  config = config,
}
