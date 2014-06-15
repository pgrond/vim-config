"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
" We are using Vunlde now 
"call pathogen#infect('/home/peter/.drush/vimrc/bundle')
"call pathogen#infect('/home/peter/.vim/bundle')
" End of vimrc-install additions.

" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-abolish'
Bundle 'kien/ctrlp.vim'
Bundle 'xolox/vim-misc' 
Bundle 'xolox/vim-easytags' 
Bundle 'tpope/vim-fugitive' 
Bundle 'sjl/gundo.vim' 
Bundle 'tpope/vim-haml' 
Bundle 'Shougo/neocomplcache'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tpope/vim-ragtag' 
Bundle 'ghewgill/vim-scmdiff' 
Bundle 'vim-scripts/searchfold.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar' 
Bundle 'tomtom/tlib_vim' 
Bundle 'Shougo/unite.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'bling/vim-airline'
Bundle 'Townk/vim-autoclose' 
Bundle 'airblade/vim-gitgutter' 
Bundle 'groenewege/vim-less' 
Bundle 'nelstrom/vim-markdown-preview' 
Bundle 'garbas/vim-snipmate' 
Bundle 'mhinz/vim-startify' 
Bundle 'tpope/vim-surround' 
Bundle 'beyondwords/vim-twig' 
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'phpfolding.vim'

"===============================
" GENERAL SETTINGS
"===============================

"Use of pathogen plugin to keep each plugin in its own folder.
"inside a 'bundle' directory. It's the only way suppress / add
"plugin in a clean way.
"call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()


"Assume dark background
set background=dark

"Load file type plugins and indent files
filetype indent plugin on

"Syntax coloration
syntax on

"automaticcaly enable mouse
set mouse=a

scriptencoding utf-8
"Always edit in utf-8.
set encoding=utf-8

set backup 
set backupdir=~/.vimbackup/
set directory=~/.vimbackup/
set noswapfile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set title
set history=300
" Persistent Undo (vim 7.3 and later)
if exists('&undofile') && !&undofile
  set undodir=~/.vim_runtime/undodir
  set undofile
endif
"make vim save view (state) (folds, cursor, etc)
au BufWinLeave * silent! mkview "make vim save view (state) (folds, cursor, etc)
"make vim load view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview

"Add ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
"==============================
"Vim UI
"==============================

"Our default colorscheme use 256 colors
set t_Co=256

"Default colors
"colorscheme xoria256
"colorscheme molokai
"colorscheme mustang 
"colorscheme wombat 
colorscheme solarized

"display the current mode
set showmode

"highlight current line
set cursorline
hi cursorline guibg=#333333 " highlight bg color of current line
hi CursorColumn guibg=#333333 " highlight cursor

if has('cmdline_info')
  set ruler " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd " show partial commands in status line and
  " selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2

  "Broken down into easily includeable segments
  set statusline=%<%f\ " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y] " filetype
  set statusline+=\ [%{getcwd()}] " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

set backspace=indent,eol,start " backspace for dummys
set linespace=0 " No extra spaces between rows
set nu " Line numbers on
set showmatch " show matching brackets/parenthesis
set incsearch " find as you type search
set hlsearch " highlight search terms
" wrap search
set wrapscan
" but if our search is uppercase, search first for uppercase
set smartcase
set winminheight=0 " windows can be 0 line high
set ignorecase " case insensitive search
set smartcase " case sensitive when uc present
set wildmenu " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
set scrolljump=5 " lines to scroll when cursor leaves screen
" set foldenable " auto fold code
set gdefault " the /g flag on :s substitutions by default
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:. 
" Highlight problematic whitespace


" always keep at least 5 lines visible under the cursor when scrolling
set scrolloff=5


" print how many characters contains a line in status line
set statusline+=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{strlen(getline('.'))}\ characters\ %P

"==============================
"FORMATTING
"==============================
set wrap
set linebreak
"set the spaces instead of regular tab
set expandtab
"use smart autoindenting. Used when line ends with {
set smartindent
"use the same indent from current line when starting a new line
set autoindent

"===============================
" DRUPAL SETTINGS
"===============================

" allow to go to the declaration of a function with <ctrl-]>
" go to a project, use drupal-gentags script in scripts folder; then
" set correct path here to load tags for a given project.

" set path to your tags file here
" set tags+=~/.vim/tags/drupal-7.8.tags

set tags+=./tags
let g:easytags_dynamic_files = 2
let g:easytags_on_cursorhold = 0
"sets tab and shiftwidth to 2 spaces according to drupals coding standard
set tabstop=2 shiftwidth=2 softtabstop=2

" ensure that drupal extensions are read as php files.
" note that snipMate use filetype to load snippets
augroup drupal
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.engine set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
augroup END

"================================
" CONFIG DRUPAL CODING STANDARDS
"================================
" let g:syntastic_phpcs_conf=' --standard=Drupal  --extensions=php,module,inc,install,test,profile,theme'

"===============================
" PHP SETTINGS
"===============================

" activer l'omnicompletion pour tous les langages
set omnifunc=syntaxcomplete#Complete

" for highlighting parent error ] or )
let php_parent_error_close = 1  

" help for commenting functions
set syntax=php.doxygen

" utiliser le compilateur php pour pouvoir vérifier la syntaxe
" avec ':make' sur un fichier
" go to line with syntax error, press enter to go to next error
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

let php_folding=0

"================================
" CONFIG PLUGIN TAGLIST SETTINGS
"================================

" taglist need to know where our ctags bin is located
let Tlist_Ctags_Cmd='/usr/bin/ctags'

" show taglist at the right of the screen
let Tlist_Use_Right_Window=1

" Only print tags for current buffer
let Tlist_Show_One_File=1

" min width for taglist buffer. Drupal functions name are usually pretty long
let Tlist_WinWidth=50

" only print constants, class and functions in our taglist
let tlist_php_settings = 'php;d:Constantes;c:Classes;f:Functions'

"================================
" CONFIG PLUGIN TAGBAR  SETTINGS
"================================
let g:tagbar_autofocus = 1
"================================
" CONFIGURE NEOCOMPLCACHE
"================================
let g:neocomplcache_enable_at_startup = 1

"================================
" CONFIG PLUGIN XDEBUG
"================================

" for xdebug : we want to see what's inside array, until x levels
let g:debuggerMaxDepth = 10

"================================
" MAPPINGS
" Please note that some keys are already used
" by the debugger:
" F1, F2, F3, F4, F5, F6, F11, F12 
" So let's deal with F7, F8, F9 & F10
"================================

" \ is definitly too difficult to reach !
" choose a more accessible 'leader' and 'localleader'
let mapleader = ","
let maplocalleader=","

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" jump to tag definition (for example a function) when press F7
" you need ctags to make this works through a whole project
noremap <F7> <C-w>]
inoremap <F7> <Esc><C-w>]

"F12 toogle taglist buffer
" nnoremap <silent> <F9> :TlistToggle<CR>

"F9 toogle tagbar buffer
nnoremap <silent> <F9> :TagbarToggle<CR>
" open Navigation window with native nerdtree
"nmap <silent><F9> :NERDTreeToggle<CR>
"imap <silent><F9> :NERDTreeToggle<CR>

" open navigation with nerdree-tabs, which make
" NerdTree behave more like in a classic IDE
nmap <silent><F8> :NERDTreeToggle<CR>
imap <silent><F8> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

nnoremap <F10> :GundoToggle<CR>

" Window movement
map <A-h> <C-w>h<C-W>_
map <A-j> <C-w>j<C-W>_
map <A-k> <C-w>k<C-W>_
map <A-l> <C-w>l<C-W>_
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Toggle spell checking on and off with `;s`
nmap <silent> <leader>s :set spell!<CR>
" Set region to American English
set spelllang=en_us

set pastetoggle=<F2>

nnoremap j gj
nnoremap k gk

nmap <silent> <leader>/ :nohlsearch<CR>

map <C-F5> <Esc>:EnableFastPHPFolds<Cr> 
map <C-F6> <Esc>:EnablePHPFolds<Cr> 
map <C-F7> <Esc>:DisablePHPFolds<Cr>

map <C-f><C-f> <Esc>zfa}><Cr> 

nnoremap <Esc>P P'[v']=
nnoremap <Esc>p p'[v']=

" in case your cscope execute is not in system path.
" let g:cscope_cmd = 'D:/tools/vim/cscope.exe'
" s: Find this C symbol
map <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
map <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
map <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
map <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
map <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
map <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
map <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
map <leader>l :call ToggleLocationList()<CR>


map <leader>ms :mksession! ~/vim_session <cr> " Quick write session with F2
map <leader>ss :source ~/vim_session <cr>     " And load session with F3

map <leader>t :CtrlP<CR>
"================================
" CUSTOM FUNCTIONS 
"================================
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


function! NERDTreeInitAsNeeded()
  redir => bufoutput
  buffers!
  redir END
  let idx = stridx(bufoutput, "NERD_tree")
  if idx > -1
    NERDTreeMirror
    NERDTreeFind
    wincmd l
  endif
endfunction

if has("cscope")

  function! CScope_Refresh()
    cs kill 0
    !find $PWD -type f | egrep "\.(php|js|module|info|install|inc)$" > files && cscope -b -i files
"    !find $PWD -name \*.php > files && cscope -b -i files
"    !find $PWD -name \*.js >> files && cscope -b -i files
"    !find $PWD -name \*.module >> files && cscope -b -i files
"    !find $PWD -name \*.info >> files && cscope -b -i files
"    !find $PWD -name \*.install >> files && cscope -b -i files
"     !find $PWD -name \*.inc >> files && cscope -b -i files
     cs add .
     !rm -f files
    endfunction
  comm! -nargs=0 R call CScope_Refresh()
endif

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
