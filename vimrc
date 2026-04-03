" basic configuration

set background=dark
set mouse=a             " allow mouse mode
set termguicolors       " enable true color (uses guifg/guibg from colorschemes)
syntax on               " syntax highlighting
set hlsearch            " highlight all search results
set ignorecase          " case insensitive search
set smartcase           " smart case to avoid ignorecase toggles
set incsearch           " incremental search
set number              " show current line number
set relativenumber      " show relative line numbers
let mapleader = "'"     " remap the leader to '

inoremap <nowait> jj <ESC>       " remap escape to "jj"

" Enable focus event reporting so FocusGained/FocusLost autocmds fire in tmux
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"

" With Claude Code for example I want external edits to show up live in vim
" these settings allow us to refresh when changes externally occur
set autoread            " Automatically read the file if changed outside vim, if no unsaved changes
set updatetime=200      " frequency knob
augroup autoread_live   " reload trigger
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold *
        \ if mode() != 'c' | checktime | endif
  autocmd FocusGained * set cursorline
  autocmd FocusLost   * set nocursorline | highlight CursorLine guibg=NONE ctermbg=NONE
augroup END


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

" ── Buffers ─────────────────────────────────────────────────────────────────
set hidden                          " allow switching buffers without saving
nnoremap <Tab>   :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>b :ls<CR>:b<Space>

" ── Tags (ctags) ─────────────────────────────────────────────────────────────
set tags=./tags;/                   " search up the tree for a tags file
nnoremap <C-]>     g<C-]>           " show list if multiple matches
nnoremap <C-w>]    <C-w>g]          " open definition in split
nnoremap <leader>] :tselect<CR>     " pick from tag match list

" ── plugins ──────────────────────────────────────────────────────────────────
" Auto-install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'Lokaltog/vim-monotone'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'

call plug#end()

colorscheme monotone
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" ── fzf.vim ──────────────────────────────────────────────────────────────────
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files ~<CR>
nnoremap <leader>p :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>t :BTags<CR>

let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:55%:hidden', 'ctrl-/']

" ── buftabline ───────────────────────────────────────────────────────────────
let g:buftabline_numbers = 1        " show buffer numbers
let g:buftabline_indicators = 1     " show modified indicator

" ── ALE ──────────────────────────────────────────────────────────────────────
let g:ale_linters = { 'python': ['ruff'] }
let g:ale_fixers  = { 'python': ['ruff', 'ruff_format'] }
let g:ale_fix_on_save = 1
