" basic configuration

set background=dark     " remove background
set mouse=a             " allow mouse mode
syntax on               " syntax highlighting
set hlsearch            " highlight all search results
set ignorecase          " case insensitive search
set smartcase           " smart case to avoid ignorecase toggles
set incsearch           " incremental search
set number              " show current line number
set relativenumber      " show relative line numbers
let mapleader = "'"     " remap the leader to '
color flate2            " set theme to the flate theme

inoremap <nowait> jj <ESC>       " remap escape to "jj"

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" misc
set autoindent
set ruler
set cursorline
set wrap
set textwidth=120
set formatoptions=qrn1
set colorcolumn=100
highlight LineNr ctermfg=grey
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" plugins
" :PlugInstall to install the plugins
call plug#begin()

Plug 'dense-analysis/ale'

call plug#end()

" Plugin Settings
" Enable Ruff as the linter for Python files
let g:ale_linters = { 'python': ['ruff'] }

" Optional: Configure ALE to automatically fix issues when saving
let g:ale_fixers = { 'python': ['ruff', 'ruff_format']}
let g:ale_fix_on_save = 1
