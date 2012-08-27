set nocompatible

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

" Hightlight text that goes over the 80-column limit.
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

map :W :wa
map :Q :qa
map :waq :wq
map <F1> :bp<Return>
map <F2> :bn<Return>
imap <F1> <Esc>:bp<Return>
imap <F2> <Esc>:bn<Return>
nmap ,t :!(cd %:p:h;ctags *.[ch])&
map th :tabprev<CR>
map tl :tabnext<CR>

set t_Co=256
let g:zenburn_high_Contrast=0
let g:zenburn_old_Visual=1
colorscheme zenburn

"" turn on syntax highligting only when the terminal supports colors
if &t_Co > 1
        syntax enable " also triggers ':filetype on'
endif

filetype plugin indent on

autocmd FileType python setlocal ts=4 et sw=4 sts=4 fo=croqn
"autocmd FileType erlang set fo-=t fo+=croql sw=4 sts=4
autocmd FileType erlang set sw=4 sts=4
autocmd FileType perl   set fo-=t fo+=croql
autocmd FileType lisp   set fo-=t fo+=croql
autocmd FileType html   set sw=2 sts=2
autocmd FileType xml    set sw=2 sts=2
autocmd FileType cpp    set sw=2 sts=2
autocmd FileType objc   set ts=4 sw=4 sts=4

autocmd BufRead,BufNewFile Vagrantfile set ft=ruby
autocmd BufRead,BufNewFile *.asd set ft=lisp
autocmd BufRead,BufNewFile *.arc set ft=lisp

autocmd BufRead,BufNewFile *.lisp so ~/.vim/VIlisp-2.3/VIlisp.vim

"""
""" Vim Addon Manager
"""
fun! EnsureVamIsOnDisk(vam_install_path)
  " windows users may want to use http://mawercer.de/~marc/vam/index.php
  " to fetch VAM, VAM-known-repositories and the listed plugins
  " without having to install curl, 7-zip and git tools first
  " -> BUG [4] (git-less installation)
  let is_installed_c = "isdirectory(a:vam_install_path.'/vim-addon-manager/autoload')"
  if eval(is_installed_c)
    return 1
  else
    if 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
      call mkdir(a:vam_install_path, 'p')
      execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
      " VAM runs helptags automatically when you install or update 
      " plugins
      exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
    endif
    return eval(is_installed_c)
  endif
endf

fun! SetupVAM()
  " VAM install location:
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  if !EnsureVamIsOnDisk(vam_install_path)
    echohl ErrorMsg
    echomsg "No VAM found!"
    echohl NONE
    return
  endif
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " Tell VAM which plugins to fetch & load:
  call vam#ActivateAddons(['github:tpope/vim-fugitive', 'github:tpope/vim-markdown', 'github:tpope/vim-rails', 'github:tpope/vim-repeat', 'github:tpope/vim-surround', 'github:tpope/vim-unimpaired', 'github:kchmck/vim-coffee-script', 'github:msanders/snipmate.vim', 'github:scrooloose/syntastic', 'github:godlygeek/tabular', 'github:groenewege/vim-less'], {'auto_install' : 1})
endfun
call SetupVAM()
