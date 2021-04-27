" Boostrap {{{
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
" }}}

" Plugins {{{
  call plug#begin('~/.config/nvim/plugged')
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'andymass/vim-matchup'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-user'
    Plug 'liuchengxu/vista.vim'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'machakann/vim-highlightedyank'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'moll/vim-bbye'
    Plug 'neovim/nvim-lspconfig'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'pgdouyon/vim-evanesco'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'sstallion/vim-cursorline'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-rsi'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-airline/vim-airline'
  call plug#end()
" }}}

" Globals {{{
  set background=dark
  set cmdheight=2
  set cursorline
  set diffopt=vertical
  set encoding=utf8
  set expandtab
  set fdm=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set foldlevelstart=99
  set guicursor=
  set hlsearch
  set ignorecase
  set lazyredraw
  set modelines=1
  set mouse=a
  set nocompatible
  set nostartofline
  set noswapfile
  set number
  set shiftwidth=2
  set shortmess+=c
  set shortmess+=c
  set signcolumn=number
  set signcolumn=yes
  set smartcase
  set spelllang=en_us
  set splitbelow
  set splitright
  set t_Co=256
  set tabstop=2
  set termguicolors
  set ttyfast
  set updatetime=300

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
" }}}

" Theme {{{
  try
    colorscheme dracula
  catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
  endtry
" }}}

" Mappings {{{
  map <silent> <s-q> :Bdelete<cr>
  map <silent> <s-right> :bn<cr>
  map <silent> <s-left> :bp<cr>

  map <silent> <leader>[ :NERDTreeClose<cr>:Vista!!<cr>
  map <silent> <leader>] :Vista!<cr>:NERDTreeToggle<cr>

  nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
  nnoremap <leader>ez :e ~/.zshrc<cr>

  nnoremap <expr> <up> v:count == 0 ? 'gk' : 'k'
  nnoremap <expr> <down> v:count == 0 ? 'gj' : 'j'
  nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
  nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

  nnoremap <silent> <c-left> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-down> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-up> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-right> :TmuxNavigateRight<cr>
  nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

  nmap <silent> <c-p> :FZF<cr>
" }}}

" Config {{{
  let $FZF_DEFAULT_OPTS = "--ansi --preview-window 'right:60%' --layout reverse --bind 'alt-j:preview-down,alt-k:preview-up,alt-d:preview-page-down,alt-u:preview-page-up' --preview 'bat --theme Dracula --style snip --color always {}'"
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeWinPos = 'right'
  let g:NERDTreeWinSize = 40
  let g:airline#extensions#tabline#enabled = 1
  let g:better_whitespace_enabled = 1
  let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-i': 'split', 'ctrl-s': 'vsplit' }
  let g:gitgutter_map_keys = 0
  let g:gutentags_ctags_tagfile = '.ctags'
  let g:highlightedyank_highlight_duration = 150
  let g:strip_whitespace_on_save = 1
  let g:tmux_navigator_no_mappings = 1
  let g:vista_executive = 'nvim_lsp'
  let g:vista_finder_alternative_executives = 'ctags'
  let g:vista_sidebar_width = 40
  let mapleader = "\\"

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "java", "go", "json"},
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true
    },
  }
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local servers = { "pyright", "gopls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    root_dir = nvim_lsp.util.find_git_root,
  }
end
EOF
" }}}
