local M = {}

function M.treesitter()
    return {
      name = 'javascript'
    }
end

function M.lsp()
  return {
    name = 'tsserver',
    setup = {}
  }
end

return M
