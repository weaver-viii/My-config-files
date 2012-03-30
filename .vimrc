" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

 call pathogen#infect()
 call pathogen#helptags()

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink

set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" =============== Key mappings =====================

""" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Follow links in help
map <F12> <C-]>
" Nerdtree shortcut
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" ================ Vundle Settings ================

 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'scrooloose/nerdtree.git'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'tpope/vim-git.git'
 Bundle 'tpope/vim-surround.git'
 Bundle 'tsaleh/vim-align.git'
 Bundle 'tsaleh/vim-supertab.git'
 Bundle 'bdd/vim-scala.git'
 Bundle 'noxoc/vim-tcomment.git'
 Bundle 'vim-scripts/VimClojure'
 Bundle 'vim-scripts/plist.vim'
 Bundle 'mikewest/vimroom'
 Bundle 'suan/vim-instant-markdown'
 Bundle 'jeffkreeftmeijer/vim-numbertoggle'
 Bundle 'jpalardy/vim-slime'
 " vim-scripts repos
 " non github repos
 " ...

 filetype plugin indent on     " required! 

" Settings for VimClojure
 let vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
 let vimclojure#ParenRainbow=1           " Rainbow parentheses'!

"turn on syntax highlighting and use solarized colorsheme
syntax on
set background=dark
colorscheme solarized

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode.

if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set pastetoggle=<F9> "Toggles correctly indented pasteing

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Clojure ===========================

let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let g:clj_paren_rainbow=1           " Rainbow parentheses'!
let g:slime_target = "tmux"
