local function config()
  require("luasnip.loaders.from_vscode").lazy_load()
end

return {
  "L3MON4D3/LuaSnip",
  config = config,
  requires = {
    "rafamadriz/friendly-snippets",
  },
}
