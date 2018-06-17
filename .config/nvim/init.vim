" Colors
" colorscheme
colorscheme pencil

" enable syntax processing
syntax enable

" Spaces & Tabs
" number of visual spaces per TAB
set tabstop=2
" number of spaces in tab when editing
set softtabstop=2
set shiftwidth=2

" tabs are spaces
set expandtab

" UI Config
" show line numbers
set number

" show command in bottom bar
set showcmd

" load filetype-specific ident files
filetype indent on

" visual autocomplete for command menu
set wildmenu

" highlight mathing [{()}]
set showmatch

" Searching
" highlight matches
set hlsearch

" search as characters are entered
set incsearch

" enabe mouse scrolling
set mouse=a

" enabe copy to X clipborad buffer
set clipboard=unnamedplus

" forget about arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Plugins
" plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'lowtype/vim-flow'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'w0rp/ale'
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'digitaltoad/vim-pug'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:neosnippet#enable_completed_snippet = 1

" ALE
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '✱'

let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'css': ['stylelint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'css': ['stylelint'],
\}

nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <leader>af :ALEFix<cr>

" Toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" FZF
" use silver search
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <leader>fz :FZF<cr>

" NeoSnippet
" <C-k> autocplete snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
