" Section: Core Configuration

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Section: Sensible Settings

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set modelineexpr

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch

if &synmaxcol == 3000
  " Lowering this improves performance in files with long lines.
  set synmaxcol=500
endif

set laststatus=2
set ruler
set wildmenu

set scrolloff=1
set sidescrolloff=5
set display+=lastline

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Delete comment character when joining commented lines.
set formatoptions+=j

set autoread
set history=1000
set tabpagemax=50

if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options
set viewoptions-=options

runtime! macros/matchit.vim

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" Section: My Stuff

set nobackup
set nowritebackup
set noswapfile

set tabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set smarttab
set shiftround
set nojoinspaces

" Use a more natural split layout of below and to the right.
set splitbelow
set splitright

" Section: Search

set ignorecase
set smartcase
set hlsearch
set showmatch

" Set the leader key to space.
let mapleader=" "

" Set <leader>c to clear search highlighting.
noremap <leader>c :noh<cr>

" Section: Appearance

" Enable 24-bit color.
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Gruvbox dark color scheme.
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
set t_ZH=
set t_ZR=

" Always draw the sign column. This keeps the buffer from moving when
" adding/deleting signs (e.g. gitgutter, LanguageServer).
set signcolumn=yes

" Highlight the column after the current textwidth setting.
set colorcolumn=+1

" Show the current line number, and use relative line numbering to make motion
" commands easier.
set number
set relativenumber

" Highlight the current line.
set cursorline

" Don't show the current mode in the modeline; LightLine handles that for us.
set noshowmode

" Always show the status line.
set laststatus=2

" Section: File Types

" These files are actually ruby.
autocmd BufNewFile,BufRead Podfile,*.podspec,Appfile,Fastfile,Matchfile setfiletype ruby

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
