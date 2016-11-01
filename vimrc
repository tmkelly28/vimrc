" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Leader - ( Spacebar )
let mapleader = " "

execute pathogen#infect()
call pathogen#helptags()

let g:used_javascript_libs = 'angularjs,angularui,react,redux,jasmine,chai'
let g:JSHintHighlightErrorLine = 1

set path=$PWD/**

"Favorites: Tomorrow-Night
colorscheme Tomorrow

syntax on

set number
set tabstop=2
set autoindent
set mouse=a
set noswapfile
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
set scrolloff=8   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1  " Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildignore+=**/dump/**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set matchpairs+=<:> "HTML Editing
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set encoding=utf-8
set shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list
set hlsearch
set ignorecase
set smartcase
set hidden
set nobackup
set nowritebackup
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview

inoremap jk <esc>
inoremap kj <esc>
nnoremap <leader>; A;<esc>

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Autocomplete pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ` ``<Esc>i

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" <Off> Navigate properly when lines are wrapped
" nnoremap j gj
" nnoremap k gk

""" NerdTree """
autocmd vimenter * NERDTree  " Open NERDTREE when vim opens
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if only NERDTree is open
nnoremap <S-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git', '.DS_Store']

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------Plugins-------
Plugin 'gcmt/breeze.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

call vundle#end()
filetype plugin indent on

noremap  <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" tern_for_vim - turn off the preview window
set completeopt-=preview

" vim-jsx - allow syntax highlighting in .js files
let g:jsx_ext_required = 0

" CtrlP
" If Ctrl P can't find a file, use CtrlPClearAllCaches to clear

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" Find
map <C-f> /
" Indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
" Undo, Redo
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
" Tabs
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-l>  :tabnext<CR>
inoremap <C-l>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i
" Toggle Git Gutter
noremap  <Leader>g :GitGutterToggle<CR>

" This machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Fix paste from system clipboard
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" Move lines up or down
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
