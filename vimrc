" Enable syntax highlighting if the terminal has colors.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on  " Enable filetype-specific indenting and plugins.

set noautowrite
set backspace=indent,eol,start     " Allow backspacing over everything in insert mode.
set directory=~/.tmp               " Don't clutter up dirs with swp and tmp files.
set backupdir=~/.tmp
set noerrorbells
set visualbell
set t_vb=

set title                          " Set the terminal title.
set ignorecase smartcase           " Ignore case in patterns when they are all lowercase.
set laststatus=2                   " Always show the status line.
set report=0                       " Always show the number of lines that have changed.

set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=8

set showcmd
set showmode
set showmatch                      " Show matching parentheses...
set matchtime=5                    " ...for 5 tenths of a second.
set textwidth=78
set nowrap
set hlsearch
set incsearch                      " Show search text as it is being typed.
set gdefault                       " Assume the `/g` flag on `:s` substitutions.
set viminfo+=!
set number                         " Show line numbers.
set noesckeys                      " Get rid of the delay when hitting esc.
set shiftround                     " When at 3 spaces and I hit >>, go to 4, not 5.
set list listchars=tab:»·,trail:·  " Display extra whitespace.
set ruler                          " Always show the cursor position.

set tags=~/.mytags

set background=dark
let g:solarized_menu=0
colorscheme solarized

augroup vimrcEx
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or
    " when inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

  " Set syntax highlighting for specific file types.
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown.
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown.
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

augroup END

augroup python
  autocmd!

  autocmd FileType python setlocal shiftwidth=4 textwidth=79
  autocmd FileType python set omnifunc=pythoncomplete#Complete

  let g:SuperTabDefaultCompletionType="context"
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Treat <li> and <p> tags like the block tags they are.
let g:html_indent_tags = 'li\|p'

let mapleader = " "
map <leader>t :w <CR> :!nosetests <CR>
map :W :wa
map :Q :qa
map :waq :wq
map <silent> <leader>h :nohls <CR>

" Tab navigation.
nmap <leader>th :tabprev<CR>
nmap <leader>tl :tabnext<CR>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>0 10gt

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Map C-s to save. Note that this requires your bashrc or zshrc to disable
" flow control.
map  <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
