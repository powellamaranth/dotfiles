local function config()
  local langs = require("bootstrap").load_langs()

  local get_server_name = function(lang)
    return lang.lsp().name
  end

  require("nvim-lsp-installer").setup({
    ensure_installed = vim.tbl_values(vim.tbl_map(get_server_name, langs)),
    automatic_installation = true,
  })

  local handlers = {}
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach = function(_client, bufnr)
    local opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<space>wl",
      "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
      opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

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
