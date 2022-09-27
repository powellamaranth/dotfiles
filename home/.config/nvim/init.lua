-- [[Bootstrapping]]
  local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end

  local packer_bootstrap = ensure_packer()
-- [[]]

-- [[Plugins]]
  require('packer').startup(function(use)
    use { 'akinsho/bufferline.nvim' }                          -- Top line
    use { 'folke/tokyonight.nvim' }                            -- Theme
    use { 'ggandor/lightspeed.nvim' }                          -- Moving around
    use { 'gpanders/editorconfig.nvim' }                       -- Editor config plugin
    use { 'hrsh7th/nvim-cmp' }                                 -- Auto completion
    use { 'jdhao/better-escape.vim', event = 'InsertEnter' }   -- Exit insert mode
    use { 'kyazdani42/nvim-tree.lua' }                         -- File explorer
    use { 'kyazdani42/nvim-web-devicons' }                     -- Icons
    use { 'neoclide/coc.nvim', branch = 'release' }            -- Lsp
    use { 'numToStr/Comment.nvim' }                            -- Handle comments
    use { 'nvim-lua/plenary.nvim' }                            -- Required by telescope
    use { 'nvim-lualine/lualine.nvim' }                        -- Bottom line
    use { 'nvim-telescope/telescope.nvim' }                    -- Fuzzy finder
    use { 'nvim-treesitter/nvim-treesitter' }                  -- Syntax highlighting
    use { 'rcarriga/nvim-notify' }                             -- Notifications
    use { 'sitiom/nvim-numbertoggle' }                         -- Number toggle insert/normal mode
    use { 'sunaku/tmux-navigate' }                             -- Tmux seamlessly navigation
    use { 'tpope/vim-repeat' }                                 -- Repeat plugin
    use { 'tpope/vim-surround' }                               -- Surround plugin
    use { 'wbthomason/packer.nvim' }                           -- Packer
    use { 'windwp/nvim-autopairs' }                            -- Auto close brackets

    if packer_bootstrap then
      require('packer').sync()
    end
  end)
-- [[]]

-- [[Options]]
  vim.opt.backup                 = false                              -- Disable making a backup file
  vim.opt.cmdheight              = 1                                  -- Number of screen lines to use for the command line
  vim.opt.colorcolumn            = "99999"                            -- Fix for the indentline problem
  vim.opt.completeopt            = { "menu", "menuone", "noselect" }  -- Options for insert mode completion
  vim.opt.conceallevel           = 0                                  -- Show text normally
  vim.opt.cursorline             = false                              -- Enable cursor line
  vim.opt.expandtab              = true                               -- Enable the use of space in tab
  vim.opt.fileencoding           = "utf-8"                            -- File content encoding for the buffer
  vim.opt.foldexpr               = "nvim_treesitter#foldexpr()"       -- Folding expression
  vim.opt.foldlevelstart         = 99                                 -- Folding level
  vim.opt.foldmethod             = "expr"                             -- Treesitter folding
  vim.opt.hidden                 = true                               -- Ignore unsaved buffers
  vim.opt.hlsearch               = true                               -- Highlight all the matches of search pattern
  vim.opt.ignorecase             = true                               -- Case insensitive searching
  vim.opt.laststatus             = 3                                  -- Global status line
  vim.opt.mouse                  = "a"                                -- Enable mouse support
  vim.opt.number                 = true                               -- Show numberline
  vim.opt.shiftwidth             = 2                                  -- Number of space inserted for indentation
  vim.opt.showmode               = false                              -- Disable showing modes in command line
  vim.opt.signcolumn             = "yes"                              -- Always show the sign column
  vim.opt.smartcase              = true                               -- Case sensitivie searching
  vim.opt.smartindent            = true                               -- Do auto indenting when starting a new line
  vim.opt.spell                  = false                              -- Disable spelling checking and highlighting
  vim.opt.spelllang              = "en"                               -- Support US english
  vim.opt.splitbelow             = true                               -- Splitting a new window below the current one
  vim.opt.splitright             = true                               -- Splitting a new window at the right of the current one
  vim.opt.swapfile               = false                              -- Disable use of swapfile for the buffer
  vim.opt.tabstop                = 2                                  -- Number of space in a tab
  vim.opt.termguicolors          = true                               -- Enable 24-bit RGB color in the TU
  vim.opt.undofile               = true                               -- Enable persistent undo
  vim.opt.updatetime             = 300                                -- Having longer updatetime leads to noticeable delays and poor user experience
  vim.opt.wrap                   = false                              -- Disable wrapping of lines longer than the width of window
  vim.opt.writebackup            = false                              -- Disable making a backup before overwriting a file
-- [[]]

-- [[Globals]]
  vim.g.do_filetype_lua          = 1                                  -- Use filetype.lua
  vim.g.loaded_2html_plugin      = true                               -- Disable built-in
  vim.g.loaded_getscript         = true                               -- Disable built-in
  vim.g.loaded_getscriptPlugin   = true                               -- Disable built-in
  vim.g.loaded_gzip              = true                               -- Disable built-in
  vim.g.loaded_logipat           = true                               -- Disable built-in
  vim.g.loaded_netrwFileHandlers = true                               -- Disable built-in
  vim.g.loaded_netrwPlugin       = true                               -- Disable built-in
  vim.g.loaded_netrwSettngs      = true                               -- Disable built-in
  vim.g.loaded_remote_plugins    = true                               -- Disable built-in
  vim.g.loaded_tar               = true                               -- Disable built-in
  vim.g.loaded_tarPlugin         = true                               -- Disable built-in
  vim.g.loaded_vimball           = true                               -- Disable built-in
  vim.g.loaded_vimballPlugin     = true                               -- Disable built-in
  vim.g.loaded_zip               = true                               -- Disable built-in
  vim.g.loaded_zipPlugin         = true                               -- Disable built-in
  vim.g.zipPlugin                = true                               -- Disable built-in
-- [[]]

-- [[Mappings]]
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("", "<space>", "<nop>", opts)
-- [[]]
