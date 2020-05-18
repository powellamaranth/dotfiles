scriptencoding utf-16

" Boostrap {{{
  if empty(glob('~/.vim/autoload/plug.vim')) && !has('nvim')
    exe 'silent !curl -fLo '.expand('~/.vim/autoload/plug.vim').' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | exit | source $MYVIMRC
  endif
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim')) && has('nvim')
    exe 'silent !curl -fLo '.expand('~/.local/share/nvim/site/autoload/plug.vim').' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | exit | source $MYVIMRC
  endif
" }}}

" Plugins {{{
  call plug#begin('~/.vim/plugged')
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'andymass/vim-matchup'
    Plug 'benmills/vimux'
    Plug 'bhurlow/vim-parinfer'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ervandew/supertab'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'janko-m/vim-test'
    Plug 'jiangmiao/auto-pairs'
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-user'
    Plug 'liuchengxu/vista.vim'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'luochen1990/rainbow'
    Plug 'machakann/vim-highlightedyank'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'moll/vim-bbye'
    Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
    Plug 'pgdouyon/vim-evanesco'
    Plug 'scrooloose/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'sstallion/vim-cursorline'
    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
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
  set colorcolumn=80
  set cursorline
  set diffopt=vertical
  set encoding=utf8
  set expandtab
  set fdm=indent
  set foldlevelstart=99
  set hlsearch
  set ignorecase
  set lazyredraw
  set modelines=1
  set mouse=a
  set nocompatible
  set noeb vb t_vb=
  set nostartofline
  set noswapfile
  set number
  set shiftwidth=2
  set shortmess+=c
  set signcolumn=yes
  set smartcase
  set spelllang=en_us
  set splitbelow
  set splitright
  set t_Co=256
  set tabstop=2
  set ttyfast
  set updatetime=300

  if has('termguicolors')
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

    set termguicolors
  endif

  if has('nvim')
    set guicursor=
  end

  if !has('nvim')
    set ttymouse=xterm2
  end

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

" Plugin Config {{{
  let &t_ut = ''
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeWinPos = 'right'
  let g:NERDTreeWinSize = 40
  let g:airline#extensions#tabline#enabled = 1
  let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-i': 'split', 'ctrl-s': 'vsplit' }
  let g:gitgutter_map_keys = 0
  let g:highlightedyank_highlight_duration = 150
  let g:rainbow_active = 1
  let g:tmux_navigator_no_mappings = 1
  let g:vista_sidebar_width = 40
  let test#strategy = "vimux"
" }}}

" Theme {{{
  try
    colorscheme onedark
  catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
  endtry
" }}}

" Mappings {{{
  let mapleader = "\\"

  map <silent> <s-q> :Bdelete<cr>
  map <silent> <s-Right> :bn<cr>
  map <silent> <s-Left> :bp<cr>

  nnoremap <tab> >>
  nnoremap <s-tab> <<
  vnoremap <tab> >gv
  vnoremap <s-tab> <gv

  xmap gai <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  map <silent> <leader>[ :NERDTreeClose<cr>:Vista!!<cr>
  map <silent> <leader>] :Vista!<cr>:NERDTreeToggle<cr>

  map <leader>v :vs<cr>
  map <leader>s :sp<cr>

  map <leader>t :TestNearest<cr>
  map <leader>T :TestFile<cr>

  nnoremap <leader>ev :e $MYVIMRC<cr>
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

  nnoremap <space> za

  nmap <silent> <c-p> :FZF<cr>

  vmap <c-c> "+y
  nmap <c-x> "+c
  nmap <c-v> c<esc>"+p
  imap <c-v> <esc>"+pa
  cmap <c-v> <c-r>+

  map  <esc>[1;5A <c-Up>
  map  <esc>[1;5B <c-Down>
  map  <esc>[1;5D <c-Left>
  map  <esc>[1;5C <c-Right>

  cmap <esc>[1;5A <c-Up>
  cmap <esc>[1;5B <c-Down>
  cmap <esc>[1;5D <c-Left>
  cmap <esc>[1;5C <c-Right>

  map  <esc>[1;2D <s-Left>
  map  <esc>[1;2C <s-Right>

  cmap <esc>[1;2D <s-Left>
  cmap <esc>[1;2C <s-Right>
" }}}

" AutoGroups {{{
  augroup vimrc-reload
    au!
    au BufWritePost .vimrc nested source % | redraw
  augroup END
" }}}

