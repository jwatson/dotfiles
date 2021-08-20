" Section: Sensible

set nocompatible
set modelineexpr

filetype plugin indent on
syntax enable

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set incsearch

set laststatus=2
set ruler
set wildmenu

set scrolloff=1
set sidescrolloff=5
set display+=lastline

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set autoread

set history=1000
set tabpagemax=50
set viminfo^=!
set sessionoptions-=options
set viewoptions-=options

runtime! macros/matchit.vim

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif

if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" Section: Plugins

call plug#begin('~/.vim/plugged')

" Appearance
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

call plug#end()

" Section: Editor

let mapleader = "\<Space>"

set nobackup
set nowritebackup
set noswapfile
set hidden

set textwidth=80
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround

set number
set numberwidth=5
set relativenumber

" Delete comment character when joining commented lines.
set formatoptions+=j

" Toggle paste mode.
nnoremap <leader>p <esc>:set paste!<cr>

" Section: Appearance

" This is tmux/truecolor magic that I've cargo-culted from the web.
" See :h xterm-true-color for the details.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors

" Gruvbox dark w/medium contrast and italics.
set background=dark
colorscheme gruvbox
let g:gruvbox_italic=1

" Make it obvious where 80 characters is.
set colorcolumn=+1

" Automatically rebalance windows on vim resize.
autocmd VimResized * GoldenRatioResize

" Open new split panes to right and bottom.
set splitbelow
set splitright

" Section: Airline

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Section: fzy

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("fd . -t f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("fd . -t f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("fd . -t f", ":sp")<cr>

" Section: CoC

set cmdheight=2
set updatetime=300
set shortmess+=c
"set signcolumn=number

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use TAB to trigger completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Section: JSON

let g:vim_json_syntax_conceal = 0

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
