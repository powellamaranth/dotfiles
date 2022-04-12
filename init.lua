local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require'packer'.startup({function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'andymass/vim-matchup' }
    use { 'editorconfig/editorconfig-vim' }
    use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-vsnip', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/vim-vsnip-integ', requires = 'hrsh7th/vim-vsnip' }
    use { 'jeffkreeftmeijer/vim-numbertoggle' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'mhartington/formatter.nvim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'rafamadriz/friendly-snippets', requires = 'hrsh7th/vim-vsnip' }
    use { 'rstacruz/vim-closer' }
    use { 'sstallion/vim-cursorline' }
    use { 'svermeulen/vimpeccable' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-endwise' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-rsi' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-unimpaired' }
    use { 'williamboman/nvim-lsp-installer' }

    use { 'dracula/vim', as = 'dracula', config = function()
        vim.cmd[[
            colorscheme dracula
        ]]
    end}

    use { 'ntpeters/vim-better-whitespace', config = function ()
        vim.g.strip_whitespace_on_save = true
        vim.g.better_whitespace_enabled = false
    end}

    use { 'lukas-reineke/indent-blankline.nvim', config = function ()
        require'indent_blankline'.setup {
            buftype_exclude = { 'terminal', 'nofile' },
            filetype_exclude = { 'dashboard' },
            show_end_of_line = true,
            space_char_blankline = ' ',
        }
    end}

    use { 'akinsho/bufferline.nvim', config = function()
        require'bufferline'.setup {
            options = {
                show_buffer_close_icons = false,
                always_show_bufferline = false,
                diagnostics = 'nvim_lsp',
                buffer_close_icon = '',
                close_icon = '',
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
            hijack_cursor = true,
            filters = {
                dotfiles = false,
                custom = { '.git', 'node_modules', '.cache', '.vscode', '.DS_Store' },
            },
        }

        vim.g.nvim_tree_indent_markers = 0
        vim.g.nvim_tree_highlight_opened_files = 2
        vim.g.nvim_tree_show_icons = { git = 0, files = 1, folders = 1, folder_arrows = 1 }

        vimp.nmap({ silent = true }, '<leader>t', [[:NvimTreeFindFileToggle<CR>]])
    end}

    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim', config = function ()
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

    use { 'nvim-treesitter/nvim-treesitter',     requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    }, run = ':TSUpdate', config = function()
        require'nvim-treesitter.configs'.setup {
            matchup = {
                enable = true,
            },

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },

            context_commentstring = {
                enable = true,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Enter>",
                    node_incremental = "<Enter>",
                    node_decremental = "<BS>",
                },
            },

            textobjects = {
              select = {
                enable = true,
                keymaps = {
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  ["ic"] = "@class.inner",
                  ["ab"] = "@block.outer",
                  ["ib"] = "@block.inner",
                },
              },
              swap = {
                enable = true,
                swap_next = {
                  ["<Leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                  ["<Leader>A"] = "@parameter.inner",
                },
              },
              lsp_interop = {
                enable = true,
              },
            },
        }
    end}

    use { 'hrsh7th/vim-vsnip', config = function ()
        local vimp = require'vimp'

        vimp.imap({ expr = true, silent = true }, '<Tab>', [[vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"]])
        vimp.smap({ expr = true, silent = true }, '<Tab>', [[vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"]])
        vimp.imap({ expr = true, silent = true }, '<S-Tab>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"]])
        vimp.smap({ expr = true, silent = true }, '<S-Tab>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"]])
        vimp.nmap({ silent = true }, 'gd', [[<Plug>(vsnip-select-text)]])
        vimp.xmap({ silent = true }, 'gd', [[<Plug>(vsnip-select-text)]])
        vimp.nmap({ silent = true }, 'gD', [[<Plug>(vsnip-cut-text)]])
        vimp.xmap({ silent = true }, 'gD', [[<Plug>(vsnip-cut-text)]])
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
                    ['<CR>'] = cmp.mapping.confirm(),
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
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

    use { 'nvim-telescope/telescope.nvim', requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim' ,
      'nvim-telescope/telescope-frecency.nvim' ,
    }, config = function ()
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

        vimp.nmap({ silent = true }, '<C-Left>', [[<CMD>lua require'tmux'.move_left()<CR>]])
        vimp.nmap({ silent = true }, '<C-Down>', [[<CMD>lua require'tmux'.move_down()<CR>]])
        vimp.nmap({ silent = true }, '<C-Up>', [[<CMD>lua require'tmux'.move_up()<CR>]])
        vimp.nmap({ silent = true }, '<C-Right>', [[<CMD>lua require'tmux'.move_right()<CR>]])
    end}

    use { 'glepnir/dashboard-nvim', requires = 'nvim-lua/telescope.nvim', config = function ()
        vim.g.dashboard_session_directory = '~/.config/nvim/.sessions'
        vim.g.dashboard_default_executive = 'telescope'
        vim.g.dashboard_custom_section = {
            a = {description = {"  New File                  leader e n"}, command = "DashboardNewFile"},
            b = {description = {"  Find File                 leader f f"}, command = "Telescope find_files"},
            c = {description = {"  Recents                   leader f h"}, command = "Telescope oldfiles"},
            d = {description = {"  Find Word                 leader f g"}, command = "Telescope live_grep"},
            e = {description = {"  Load Last Session         leader l  "}, command = "SessionLoad"},
            f = {description = {"  Settings                  leader e v"}, command = "edit $MYVIMRC"},
            g = {description = {"  Exit                      leader q  "}, command = "exit"}
        }

        vim.g.dashboard_custom_footer = { '' }
        vim.g.dashboard_custom_header = {
          '',
          '',
          '',
          '',
          '',
          ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
          ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
          ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
          ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
          ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
          ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
         }

        vim.cmd[[
            augroup dashboard_au
                autocmd! * <buffer>
                autocmd User dashboardReady let &l:stl = 'Dashboard'
                autocmd User dashboardReady nnoremap <buffer> <leader>q <cmd>exit<CR>
                autocmd User dashboardReady nnoremap <buffer> <leader>u <cmd>PackerUpdate<CR>
                autocmd User dashboardReady nnoremap <buffer> <leader>l <cmd>SessionLoad<CR>
            augroup END
        ]]
    end}

    if packer_bootstrap then
        require'packer'.sync()
    end
end,
config = {
    display = {
        open_fn = require'packer.util'.float,
    },
    log = { level = 'trace' },
}})

vim.g.loaded_2html_plugin = true
vim.g.loaded_gzip = true
vim.g.loaded_matchit = true
vim.g.loaded_matchparen = true
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_spec = true
vim.g.loaded_tar = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zipPlugin = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.guicursor = ''
vim.opt.breakindent = true
vim.opt.completeopt= 'menu,menuone,noinsert'
vim.opt.confirm = true
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

    nmap <silent> <S-q> :bd<CR>
    nmap <silent> <S-Right> :bn<CR>
    nmap <silent> <S-Left> :bp<CR>

    vnoremap < <gv
    vnoremap > >gv

    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]]
