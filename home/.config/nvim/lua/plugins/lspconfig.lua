local function config()
  local langs = require("bootstrap").load_langs()

  local get_server_name = function(lang)
    return lang.lsp().name
  end

  require("nvim-lsp-installer").setup({
    ensure_installed = vim.tbl_values(vim.tbl_map(get_server_name, langs)),
    automatic_installation = true,
  })

  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach = function(_client, _bufnr) end
  local handlers = {}

  for _, lang in pairs(langs) do
    local server = lang.lsp()

    require("lspconfig")[server.name].setup(vim.tbl_deep_extend("force", {
      capabilities = capabilities,
      on_attach = on_attach,
      handlers = handlers,
    }, server.opts))
  end
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  requires = {
    { "williamboman/nvim-lsp-installer" },
  },
}
