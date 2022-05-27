local function config()
  local langs = require"bootstrap".load_langs()

  require"nvim-lsp-installer".setup{
    automatic_installation = true,
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
  }

  for _, lang in pairs(langs) do
    local server = lang.lsp()
    require"lspconfig"[server.name].setup(server.setup)
  end
end

return {
  "williamboman/nvim-lsp-installer",
  "neovim/nvim-lspconfig",
  config = config
}
