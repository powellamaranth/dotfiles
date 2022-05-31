local M = {}

function M.treesitter()
  return {
    name = "lua",
  }
end

function M.lsp()
  return {
    name = "sumneko_lua",
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    },
  }
end

return M
