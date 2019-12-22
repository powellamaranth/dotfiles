scriptencoding utf-16

" Boostrap {{{
  let &runtimepath .= ','.expand('~/.vim')
  if empty(glob('~/.vim/autoload/plug.vim'))
    exe 'silent !curl -fLo '.expand('~/.vim/autoload/plug.vim').' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
    Plug 'janko-m/vim-test'
    Plug 'jgdavey/tslime.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-user'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'luochen1990/rainbow'
    Plug 'machakann/vim-highlightedyank'
    Plug 'majutsushi/tagbar'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'moll/vim-bbye'
    Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
    Plug 'pgdouyon/vim-evanesco'
    Plug 'roxma/vim-paste-easy'
    Plug 'scrooloose/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'sstallion/vim-cursorline'
    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
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
  set smartcase
  set spelllang=en_us
  set splitbelow
  set splitright
  set t_Co=256
  set tabstop=2
  set termguicolors
  set ttyfast
  set ttymouse=xterm2

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
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_ut = ''
  let g:tagbar_autofocus = 1
  let g:tagbar_width = 40
  let g:NERDTreeWinSize = 40
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeWinPos = 'right'
  let g:airline#extensions#tabline#enabled = 1
  let g:ale_sign_column_always = 1
  let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-i': 'split', 'ctrl-s': 'vsplit' }
  let g:gitgutter_map_keys = 0
  let g:rainbow_active = 1
  let g:tmux_navigator_no_mappings = 1
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

  execute "set <M-q>=\eq"
  map <silent> <M-q> :Bdelete<cr>

  execute "set <M-a>=\ea"
  map <silent> <M-a> :bp<cr>

  execute "set <M-s>=\es"
  map <silent> <M-s> :bn<cr>

  nnoremap <tab> >>
  nnoremap <s-tab> <<
  vnoremap <tab> >gv
  vnoremap <s-tab> <gv

  xmap gai <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  map <silent> <leader>[ :NERDTreeClose<cr>:TagbarToggle<cr>
  map <silent> <leader>] :TagbarClose<cr>:NERDTreeToggle<cr>

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

  vmap <C-c><C-c> <Plug>SendSelectionToTmux
  nmap <C-c><C-c> <Plug>NormalModeSendToTmux
  nmap <C-c>r <Plug>SetTmuxVars
" }}}

" AutoGroups {{{
  augroup tagbar
    au!
    au BufEnter * if bufname('#') =~ '__Tagbar__' && bufname('%') !~ '__Tagbar__' | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif
  augroup END

  augroup nerdtree
    au!
    au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif
  augroup END

  augroup vimrc-reload
    au!
    au BufWritePost .vimrc nested source % | redraw
  augroup END
"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
