local M = {}

function M.treesitter()
    return {
      name = 'lua'
    }
end

function M.lsp()
  return {
    name = 'sumneko_lua',
    setup = {}
  }
end

return M
