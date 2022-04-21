local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require'packer'.startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'folke/which-key.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'rcarriga/nvim-notify' }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'akinsho/bufferline.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'max397574/better-escape.nvim' }
  use { 'dracula/vim' }

  if packer_bootstrap then
    require'packer'.sync()
  end
end)

vim.o.termguicolors = true
vim.cmd'colorscheme dracula'
