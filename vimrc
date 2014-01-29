set nocompatible
filetype off

" ========================================================================
" Vundle stuff. No inline comments here because of
" https://github.com/gmarik/vundle/issues/13
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" General editor stuff.
" ========================================================================
" Show Git diffs in the gutter.
Bundle 'airblade/vim-gitgutter'
" Solarized color theme.
Bundle 'altercation/vim-colors-solarized'
" Use <Tab> for insert completion.
Bundle 'ervandew/supertab'
" The Silver Searcher!
Bundle 'rking/ag.vim'
" Run file through external syntax checker & display errors.
Bundle 'scrooloose/syntastic'
" Enable repeating supported plugin maps with `.`.
Bundle 'tpope/vim-repeat'
" Easily add, delete, change quotes, parens, etc. in pairs.
Bundle 'tpope/vim-surround'
" Handy bracket mappings.
Bundle 'tpope/vim-unimpaired'
" Fast file shortcuts.
Bundle 'wincent/Command-T'

" General development.
" ========================================================================
" Wisely add `end` in Ruby. Similar for Bash, C/C++, Lua.
Bundle 'tpope/vim-endwise'
" The best Git wrapper of all time.
Bundle 'tpope/vim-fugitive'
" Markdown syntax & highlighting.
Bundle 'tpope/vim-markdown'

" Web development.
" ========================================================================
" Less syntax highlighting.
Bundle 'groenewege/vim-less'
" Coffescript indent & syntax highlighting.
Bundle 'kchmck/vim-coffee-script'
" HAML, SASS, and SCSS syntax highlighting.
Bundle 'tpope/vim-haml'
" Sensible comment toggling.
Bundle 'tomtom/tcomment_vim'

" Python development.
" ========================================================================
Bundle 'hynek/vim-python-pep8-indent'

" Ruby development.
" ========================================================================
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ruby-matchit'

" Clojure development.
" ========================================================================
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'

" Fun.
" ========================================================================
Bundle 'koron/nyancat-vim'


" ============================================================================
" Python stuff.
" ============================================================================
syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable filetype-specific indenting and plugins.

" Autoindent with 4 spaces, always expand tabs.
autocmd FileType python setlocal ai ts=8 sw=4 sts=4 et
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType="context"
" ============================================================================

set noautowrite
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set directory=~/.tmp            " Don't clutter up dirs with swp and tmp files.
set backupdir=~/.tmp

set title                       " Set the terminal title.
set ignorecase smartcase        " Ignore case in patterns when they are all lowercase.
set laststatus=2                " Always show the status line.
set report=0                    " Always show the number of lines that have changed.
set ruler                       " Always show the cursor position.

set autoindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=8

set showcmd
set showmode
set showmatch                   " Show matching parentheses...
set matchtime=5                 " ...for 5 tenths of a second.
set textwidth=78
set nowrap
set hlsearch
set incsearch                   " Show search text as it is being typed.
set gdefault                    " Assume the `/g` flag on `:s` substitutions.
set viminfo+=!
set number                      " Show line numbers.
set noesckeys                   " Get rid of the delay when hitting esc.
set shiftround                  " When at 3 spaces and I hit >>, go to 4, not 5.

set tags=~/.mytags

let mapleader = ","
map <Leader>t :w <CR> :!nosetests <CR>
map  :W :wa
map  :Q :qa
map  :waq :wq
map  <F1> :bp<Return>
map  <F2> :bn<Return>
map  th :tabprev<CR>
map  tl :tabnext<CR>
imap <F1> <Esc>:bp<Return>
imap <F2> <Esc>:bn<Return>
imap <Tab> <C-P>
map  <C-h> :nohl<cr>
map  <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map  <C-t> <esc>:tabnew<CR>
"nmap ,t :!(cd %:p:h;ctags *.[ch])&

set background=dark
let g:solarized_menu=0
colorscheme solarized

autocmd FileType erlang set sw=4 sts=4
autocmd FileType perl   set fo-=t fo+=croql
autocmd FileType lisp   set fo-=t fo+=croql
autocmd FileType html   set sw=2 sts=2
autocmd FileType xml    set sw=2 sts=2
autocmd FileType cpp    set sw=2 sts=2
autocmd FileType objc   set ts=4 sw=4 sts=4

autocmd BufRead,BufNewFile     *.md        set ft=markdown
autocmd BufNewFile,BufReadPost *.coffee    setl shiftwidth=2 expandtab
autocmd BufRead,BufNewFile     Vagrantfile set ft=ruby
autocmd BufRead,BufNewFile     Podfile     set ft=ruby
autocmd BufRead,BufNewFile     *.asd       set ft=lisp
autocmd BufRead,BufNewFile     *.arc       set ft=lisp
