local function config()
  local langs = require"bootstrap".load_langs()

  local ensure_installed = {}
  for _, lang in pairs(langs) do
    ensure_installed = vim.list_extend(ensure_installed, {lang.treesitter().name})
  end

  require"nvim-treesitter.configs".setup{
    ensure_installed = ensure_installed,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }
end

return {
  "nvim-treesitter/nvim-treesitter",
  config=config,
  run = ":TSUpdate",
}
