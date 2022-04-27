local M = {}

local fn = vim.fn
local g = vim.g

function M.install_packer()
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
  end
end

function M.disable_builtins()
  g.loaded_2html_plugin = false
  g.loaded_getscript = false
  g.loaded_getscriptPlugin = false
  g.loaded_gzip = false
  g.loaded_logipat = false
  g.loaded_netrwFileHandlers = false
  g.loaded_netrwPlugin = false
  g.loaded_netrwSettngs = false
  g.loaded_remote_plugins = false
  g.loaded_tar = false
  g.loaded_tarPlugin = false
  g.loaded_zip = false
  g.loaded_zipPlugin = false
  g.loaded_vimball = false
  g.loaded_vimballPlugin = false
  g.zipPlugin = false
end

function M.load_core(modules)
  for _, module in ipairs(modules) do
    require("core." .. module)
  end
end

function M.load_plugins(modules)
  local packer = require("packer")
  local packer_util = require("packer.util")

  packer.startup({
    function(use)
      use({ "wbthomason/packer.nvim" })

      for _, module in ipairs(modules) do
        use(require("plugins." .. module))
      end
    end,
    config = {
      display = {
        open_fn = packer_util.float,
      },
    },
  })
end

return M
