local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.g.packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require'packer'.startup({function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'andymass/vim-matchup' }
  use { 'dracula/vim', as = 'dracula' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'jeffkreeftmeijer/vim-numbertoggle' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'rstacruz/vim-closer' }
  use { 'sstallion/vim-cursorline' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-rsi' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-unimpaired' }
  use { 'svermeulen/vimpeccable' }

  use { 'ntpeters/vim-better-whitespace', config = function ()
    vim.g.strip_whitespace_on_save = true
  end}

  use { 'lukas-reineke/indent-blankline.nvim', config = function ()
    require'indent_blankline'.setup {
      show_end_of_line = true,
      space_char_blankline = ' ',
    }
  end}

  use { 'akinsho/bufferline.nvim', config = function()
    require'bufferline'.setup {
      options = {
        separator_style = 'slant',
        offsets = {
          {
            filetype = 'NvimTree',
            highlight = 'Directory',
            text_align = 'left'
          }
        }
      }
    }
  end}

  use { 'kyazdani42/nvim-tree.lua', config = function()
    local tree = require'nvim-tree'
    local vimp = require'vimp'

    tree.setup {
      ignore_ft_on_setup = { 'aerial', 'alpha', 'dashboard', 'startify', 'terminal', 'quickfix' },
      hijack_cursor = true,
      filters = {
        dotfiles = false,
        custom = { '.git', 'node_modules', '.cache', '.vscode', '.DS_Store' },
      },
    }

    vim.g.nvim_tree_indent_markers = 0
    vim.g.nvim_tree_gitignore = 0
    vim.g.nvim_tree_highlight_opened_files = 2
    vim.g.nvim_tree_show_icons = { git = 0, files = 1, folders = 1, folder_arrows = 1 }

    vimp.nmap({ silent = true }, '<leader>t', [[:NvimTreeFindFileToggle<cr>]])
  end}

  use { 'lewis6991/gitsigns.nvim', config = function ()
    require'gitsigns'.setup {
      signs = {
        add = { hl = 'GitGutterAdd', text = '+' },
        change = { hl = 'GitGutterChange', text = '~' },
        delete = { hl = 'GitGutterDelete', text = '_' },
        topdelete = { hl = 'GitGutterDelete', text = '‾' },
        changedelete = { hl = 'GitGutterChange', text = '~' },
      }
    }
  end}

  use { 'nvim-lualine/lualine.nvim', config = function()
    require'lualine'.setup {}
  end}

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = 'maintained',
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        }
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          }
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          }
        }
      }
    }
  end}

  use { 'williamboman/nvim-lsp-installer', config = function ()
    local lsp_installer_servers = require'nvim-lsp-installer.servers'
    local lsp_installer = require'nvim-lsp-installer'

    local servers = {
        gopls = {},
        jdtls = {},
        jsonls = {},
        pyright = {},
        sumneko_lua = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'},
                    },
                },
            },
        },
        yamlls = {},
    }

    lsp_installer.on_server_ready(function(server)
      local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

      local opts = {
        capabilities = capabilities
      }

      if servers[server.name] then
        for k,v in pairs(servers[server.name]) do opts[k] = v end
      end

      server:setup(opts)
    end)

    for server_name, _ in pairs(servers) do
        local ok, server = lsp_installer_servers.get_server(server_name)
        if ok and not server:is_installed() then
            server:install()
        end
    end
  end}

  use { 'hrsh7th/nvim-cmp', config = function ()
    local cmp = require'cmp'

    cmp.setup({
      completion = {
        autocomplete = false,
        completeopt = 'menu,menuone,noinsert',
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm(),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
      })
    })
  end}

  use { 'glepnir/lspsaga.nvim', config = function ()
    require'lspsaga'.init_lsp_saga {}
  end}

  use { 'hrsh7th/vim-vsnip', config = function ()
    local vimp = require'vimp'

    vimp.imap({ expr = true, silent = true }, '<Tab>', [[vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"]])
    vimp.smap({ expr = true, silent = true }, '<Tab>', [[vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"]])
    vimp.imap({ expr = true, silent = true }, '<S-Tab>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"]])
    vimp.smap({ expr = true, silent = true }, '<S-Tab>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"]])
    vimp.vmap({ silent = true }, 's', [[<Plug>(vsnip-select-text)]])
    vimp.vmap({ silent = true }, 'S', [[<Plug>(vsnip-cut-text)]])
  end}

  use { 'nvim-telescope/telescope.nvim', config = function ()
    local vimp = require'vimp'

    local ff = function()
      local opts = {}
      local ok = pcall(require'telescope.builtin'.git_files, opts)
      if not ok then require'telescope.builtin'.find_files(opts) end
    end

    vimp.nnoremap('<leader>p', ff)
  end}

  use { 'nathom/tmux.nvim', config = function ()
    local vimp = require'vimp'

    vimp.nmap({ silent = true }, '<C-Left>', [[<cmd>lua require'tmux'.move_left()<cr>]])
    vimp.nmap({ silent = true }, '<C-Down>', [[<cmd>lua require'tmux'.move_down()<cr>]])
    vimp.nmap({ silent = true }, '<C-Up>', [[<cmd>lua require'tmux'.move_up()<cr>]])
    vimp.nmap({ silent = true }, '<C-Right>', [[<cmd>lua require'tmux'.move_right()<cr>]])
  end}

  if vim.g.packer_bootstrap then
    require'packer'.sync()
  end
end,
config = {
  display = {
    open_fn = require'packer.util'.float,
  }
}})

vim.g.loaded_2html_plugin = true
vim.g.loaded_gzip = true
vim.g.loaded_matchit = true
vim.g.loaded_matchparen = true
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_tar = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zipPlugin = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.breakindent = true
vim.opt.completeopt= 'menu,menuone,noinsert'
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:⋅")
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wrap = false

vim.cmd[[
  try
    colorscheme dracula
  catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
  endtry

  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qall qall

  nmap <silent> <S-q> :bd<cr>
  nmap <silent> <S-Right> :bn<cr>
  nmap <silent> <S-Left> :bp<cr>

  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
