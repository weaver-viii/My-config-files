syntax enable
set background=dark
"set background=light

set showcmd   " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase    " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned

" My preferences
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible
set modelines=0
set autoindent
set encoding=utf-8
"set number
set pastetoggle=<F9>
set ruler
set shiftround
set scrolloff=3
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
let mapleader = ","
set hlsearch
set gdefault
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
noremap <Leader>s :update<CR>
nnoremap <leader>v V`]
nnoremap <leader>h <C-w>s<C-w>l
nnoremap <leader>c <space>
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <tab> %
vnoremap <tab> %
nnoremap k gk
nmap <silent> <unique> <F5> :call Bexec()<CR>
vmap <silent> <unique> <F5> :call BexecVisual()<CR>
""" Fix home and end keybindings for screen
map [F $
imap [F $
map [H g0
imap [H g0
set wrap
set textwidth=100
set formatoptions=qrn1
"set colorcolumn=106
"set list
"set listchars=tab:▸\ ,eol:¬
au FocusLost * :wa

" Settings for VimClojure
 let vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
 let vimclojure#ParenRainbow=1           " Rainbow parentheses'!

map <F12> <C-]>
"set t_Co=16
"let g:solarized_termcolors=16
colorscheme solarized
