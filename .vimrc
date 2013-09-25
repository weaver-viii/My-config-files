" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif"

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

" navigate splits with c-hjkl
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Remap leader to ,
let mapleader = ","

" ,r returns to file explorer
map ,r :Rexplore<CR>

" ,l open TagList
map ,tl :TlistToggle<CR>

" Follow links in help
map <F12> <C-]>

" Nerdtree shortcut
""nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <Leader>d <plug>NERDTreeTabsToggle<CR>

" Quick buffer change
nnoremap <F5> :buffers<CR>:buffer<Space>

" Quick save
noremap <Leader>s :update<CR>

" Vmux mappings
map <Leader>vp :PromptVimTmuxCommand<CR>
vmap <Leader>vs "vy :call RunVimTmuxCommand(@v)<CR>
nmap <Leader>vs vip<LocalLeader>vs<CR>

" Deselect search results
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Navigate in tabs
map th :tabnext<CR>
map tl :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

" Comment out code
map <Leader>c <c-_><c-_>

" Quick format XML
map <leader>fx :1,%s/>\s*</>\r</g<CR>gg=G

" Inserts new line below"
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" Remap ESC to jj
inoremap jj <ESC>

" Sane yanking and pasting
xnoremap p pgvy

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
 Bundle 'itchyny/lightline.vim'
 Bundle 'scrooloose/nerdtree.git'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'tsaleh/vim-align.git'
 Bundle 'derekwyatt/vim-scala'
 Bundle 'jmartindf/vim-tcomment'
 Bundle 'vim-scripts/VimClojure'
 Bundle 'vim-scripts/plist.vim'
 Bundle 'jeffkreeftmeijer/vim-numbertoggle'
 Bundle 'jpalardy/vim-slime'
 Bundle 'juanpabloaj/help.vim'
 Bundle 'ervandew/supertab'
 Bundle 'Townk/vim-autoclose'
 Bundle 'vim-scripts/surround.vim'
 Bundle 'epeli/slimux'
 Bundle 'vim-scripts/taglist.vim'
 Bundle 'lukerandall/haskellmode-vim'
 Bundle 'jistr/vim-nerdtree-tabs'
 Bundle 'kien/ctrlp.vim'
 Bundle 'liquidz/lein-vim'
 Bundle 'tpope/vim-fugitive'
 Bundle 'sukima/xmledit'
 Bundle 'tpope/vim-sensible'
 Bundle 'airblade/vim-gitgutter'

" Snipmate bundles"
 Bundle 'MarcWeber/vim-addon-mw-utils'
 Bundle 'tomtom/tlib_vim'
 Bundle 'snipmate-snippets'
 Bundle 'garbas/vim-snipmate'
 " vim-scripts repos
 " non github repos
 " ...

 filetype plugin indent on     " required! 

" Settings for VimClojure
 let vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
 let vimclojure#ParenRainbow=1           " Rainbow parentheses'!

"turn on syntax highlighting and use solarized colorsheme
syntax on
set background=light
colorscheme solarized

" Settings for Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

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
" set list listchars=tab:\ \ ,trail:·

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

" ================ Tag List ==========================

let tlist_clojure_settings = 'lisp;f:function'
let Tlist_Exit_OnlyWindow=1

" ================ Haskell ===========================

au BufEnter *.hs compiler ghc

" ============== LightLine config ====================

let g:lightline = {
      \  'colorscheme': 'wombat',
      \  'component': {
      \    'readonly': '%{&readonly?"⭤":""}',
      \  },
      \  'separator': { 'left': '⮀', 'right': '⮂' },
      \  'subseparator': { 'left': '⮁', 'right': '⮃' }
      \}
