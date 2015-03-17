" Use Vim settings, rather then Vi settings (much better!).
"
" This must be first, because it changes other options as a side effect.
set nocompatible

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd InsertLeave,TextChanged * if expand('%') != '' | update | endif
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

" Follow links in help
map <F12> <C-]>

" Nerdtree shortcut
""nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <Leader>d <plug>NERDTreeTabsToggle<CR>

" Quick buffer change
nnoremap <F5> :buffers<CR>:buffer<Space>

" Quick save
noremap <Leader>s :w<CR>

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
 set shell=/bin/bash            " needs bash to work

 set rtp+=~/.vim/bundle/Vundle.vim
 " Go support
 set rtp+=/usr/local/Cellar/go/1.2.1/libexec/misc/vim
 call vundle#begin()

 " let Vundle manage Vundle
 " required! 
 Plugin 'gmarik/Vundle.vim'

 " My Plugins here:
 "
 " original repos on github
 Plugin 'bling/vim-airline'
 Plugin 'scrooloose/nerdtree.git'
 " Plugin 'altercation/vim-colors-solarized'
 Plugin 'jwhitley/vim-colors-solarized'
 Plugin 'tsaleh/vim-align.git'
 Plugin 'derekwyatt/vim-scala'
 Plugin 'tomtom/tcomment_vim'
 Plugin 'vim-scripts/VimClojure'
 Plugin 'vim-scripts/plist.vim'
 Plugin 'juanpabloaj/help.vim'
 Plugin 'ervandew/supertab'
 " Plugin 'Townk/vim-autoclose'
 Plugin 'vim-scripts/surround.vim'
 " Plugin 'epeli/slimux'
 " Plugin 'vim-scripts/taglist.vim'
 Plugin 'lukerandall/haskellmode-vim'
 Plugin 'jistr/vim-nerdtree-tabs'
 Plugin 'kien/ctrlp.vim'
 " Plugin 'liquidz/lein-vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'sukima/xmledit'
 Plugin 'tpope/vim-sensible'
 Plugin 'airblade/vim-gitgutter'
 Plugin 'derekwyatt/vim-sbt'
 Plugin 'vim-scripts/fish-syntax'
 Plugin 'elixir-lang/vim-elixir'
 Plugin 'mattonrails/vim-mix'
 Plugin 'kchmck/vim-coffee-script'
 Plugin 'elzr/vim-json'
 Plugin 'docker/docker', {'rtp': 'contrib/syntax/vim'}
 Plugin 'ingydotnet/yaml-vim'
 Plugin 'scrooloose/syntastic'
 Plugin 'tpope/vim-fireplace'
 Plugin 'vim-scripts/paredit.vim'
 Plugin 'venantius/vim-eastwood'
 Plugin 'venantius/vim-cljfmt'

" Snipmate bundles"
 Plugin 'MarcWeber/vim-addon-mw-utils'
 Plugin 'tomtom/tlib_vim'
 Plugin 'snipmate-snippets'
 Plugin 'garbas/vim-snipmate'
 " vim-scripts repos
 " non github repos
 " ...
 call vundle#end()
filetype plugin indent on     " required! 

" Settings for VimClojure
 let vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
 let vimclojure#ParenRainbow=1           " Rainbow parentheses'!

"turn on syntax highlighting and use solarized colorsheme
syntax on
set background=dark
" colorscheme solarized


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
au Filetype clojure nmap <c-c><c-k> :Require<cr>
au Filetype clojure let g:clojure_fuzzy_indent = 1
au Filetype clojure let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
au BufNewFile,BufRead *.edn set filetype=clojure
au Filetype clojure autocmd BufWritePre * :%s/\s\+$//e
function! TestToplevel() abort
    "Eval the toplevel clojure form (a deftest) and then test-var the
    "result."
    normal! ^
    let line1 = searchpair('(','',')', 'bcrn', g:fireplace#skip)
    let line2 = searchpair('(','',')', 'rn', g:fireplace#skip)
    let expr = join(getline(line1, line2), "\n")
    let var = fireplace#session_eval(expr)
    let result = fireplace#echo_session_eval("(clojure.test/test-var " . var . ")")
    return result
endfunction
au Filetype clojure nmap <c-c><c-t> :call TestToplevel()<cr>

" ================ Boot ==============================

set backup
set swapfile
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

" ================ Tag List ==========================

let tlist_clojure_settings = 'lisp;f:function'
let Tlist_Exit_OnlyWindow=1

" ================ Haskell ===========================

au BufEnter *.hs compiler ghc

" ============== Airline config ====================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'

"=============== Linenumbers =========================

set relativenumber 
set number   

" ============== syntastic ==========================
hi! link SignColumn LineNr
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

