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
filetype plugin indent on

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

set backupcopy=yes

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
Plug 'flowtype/vim-flow'
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
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-grammarous'
Plug 'mhartington/nvim-typescript', {'do': 'sh install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/denite.nvim'
Plug 'mustache/vim-mustache-handlebars'

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

" Tern
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" ALE
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '✱'

let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'css': ['stylelint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['tslint'],
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
let g:neosnippet#enable_completed_snippet = 1

" <C-k> autocplete snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

" Check grammar only for markdown and comments
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }

" Flow
let g:flow#autoclose = 1
