call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'itchyny/lightline.vim'

call plug#end()

set nobackup        " Don't make a backup before overwriting a file.
set nowritebackup   " And again.
set noswapfile      " Don't use swapfiles.
set hidden          " Don't kill unwritten buffers when hidden.

set tabstop=2       " Global tab width.
set shiftwidth=2    " And again, related.
set expandtab       " Use spaces instead of tabs.
set wrap            " Turn on line wrapping.
set nojoinspaces    " Don't add two spaces after punctuation when joining lines.

set noesckeys       " Eliminate the 1s delay after hitting escape.
set secure          " Don't let external configs do scary shit

"
" Appearance
"
"set termguicolors       " Use true color in terminals that support it.
set background=dark     " Use Solarized Dark for our color scheme.
colorscheme solarized

set colorcolumn=80      " Highlight the 80 character column.
set number              " Also show the current line number.
set cursorline          " Highlight the current line.

" Display extra whitespace.
set list listchars=tab:»·,trail:·,nbsp:·
