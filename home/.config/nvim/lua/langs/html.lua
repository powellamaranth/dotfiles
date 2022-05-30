local M = {}

function M.treesitter()
  return {
    name = "html",
  }
end

function M.lsp()
  return {
    name = "html",
    opts = {},
  }
end

return M
