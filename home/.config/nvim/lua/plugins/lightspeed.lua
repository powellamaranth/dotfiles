local function config()
  require("lightspeed").setup({})
end

return {
  "ggandor/lightspeed.nvim",
  config = config,
  requires = {
    { "tpope/vim-repeat" },
  },
}
