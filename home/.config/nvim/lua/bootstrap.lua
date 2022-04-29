
local M = {}

local fn = vim.fn
local g = vim.g

function M.load_core()
  local modules = vim.split(vim.fn.glob("~/.config/nvim/lua/core/*.lua"), "\n")
  for _, module in ipairs(modules) do
    require("core." .. module:match( "^.*/(.*).lua$" ))
  end
end

function M.load_plugins()
  local packer_bootstrap = false
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
  end

  local packer = require("packer")
  local packer_util = require("packer.util")
  local modules = vim.split(vim.fn.glob("~/.config/nvim/lua/plugins/*.lua"), "\n")

  packer.startup({
    function(use)
      for _, module in ipairs(modules) do
        use(require("plugins." .. module:match( "^.*/(.*).lua$" )))
      end

      if packer_bootstrap then
        packer.sync()
      end
    end,
    config = {
      display = {
        non_interactive = true,
      },
    },
  })
end

return M
