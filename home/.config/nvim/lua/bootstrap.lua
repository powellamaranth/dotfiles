local M = {}

local function load_modules(name)
  local modules = {}

  local files = vim.split(vim.fn.glob("~/.config/nvim/lua/" .. name .. "/*.lua"), "\n")
  for _, file in ipairs(files) do
    local module_name = name .. "." .. file:match("^.*/(.*).lua$")
    modules[module_name] = require(module_name)
  end

  return modules
end

function M.load_packer()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
  end
end

function M.load_plugins()
  local plugins = load_modules("plugins")

  require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")

    for plugin_name, _ in pairs(plugins) do
      use(require(plugin_name))
    end
  end)

  return plugins
end

function M.load_core()
  return load_modules("core")
end

function M.load_langs()
  return load_modules("langs")
end

return M
