set nocompatible
filetype off

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'koron/nyancat-vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-foreplay'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'wincent/Command-T'

syntax on
filetype plugin indent on

set noautowrite
set nobackup
set nowritebackup

set backspace=indent,eol,start
set noerrorbells
set visualbell
set t_vb=

set title
set ignorecase smartcase
set laststatus=2
set report=0
set ruler

set expandtab
set smarttab
set shiftwidth=4
set tabstop=8

set showcmd
set showmode
set showmatch
set matchtime=5
set ttyfast
set ttybuiltin
set textwidth=78
"set nowrap
set whichwrap=<,>
set wildchar=<TAB>
set undolevels=1000
set hlsearch
set incsearch
set viminfo='100,f1
set number

set complete=.,b,u,]
set wildmode=longest,list:longest

set tags=~/.mytags

map :W :wa
map :Q :qa
map :waq :wq
map <F1> :bp<Return>
map <F2> :bn<Return>
map th :tabprev<CR>
map tl :tabnext<CR>
imap <F1> <Esc>:bp<Return>
imap <F2> <Esc>:bn<Return>
imap <Tab> <C-P>
map <C-h> :nohl<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
nmap ,t :!(cd %:p:h;ctags *.[ch])&

set t_Co=256
"" turn on syntax highligting only when the terminal supports colors
if &t_Co > 1
    syntax enable " also triggers ':filetype on'
endif

"set g:zenburn_high_Contrast=0
"set g:zenburn_old_Visual=1
"colorscheme zenburn
set background=dark
set t_Co=16
let g:solarized_menu=0
colorscheme solarized

autocmd FileType python setlocal ts=4 et sw=4 sts=4 fo=croqn
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType="context"

autocmd FileType erlang set sw=4 sts=4
autocmd FileType perl   set fo-=t fo+=croql
autocmd FileType lisp   set fo-=t fo+=croql
autocmd FileType html   set sw=2 sts=2
autocmd FileType xml    set sw=2 sts=2
autocmd FileType cpp    set sw=2 sts=2
autocmd FileType objc   set ts=4 sw=4 sts=4

autocmd BufRead,BufNewFile *.md set ft=markdown
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufRead,BufNewFile Vagrantfile set ft=ruby
autocmd BufRead,BufNewFile Podfile set ft=ruby
autocmd BufRead,BufNewFile *.asd set ft=lisp
autocmd BufRead,BufNewFile *.arc set ft=lisp
