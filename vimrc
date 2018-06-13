" =============================================================================
" Defaults {{{
" A smattering of settings cribbed from $VIMRUNTIME/defaults.vim
" =============================================================================

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side-effects when it was already set.
if &compatible
    set nocompatible
endif

" Allow backspacing over everything in Insert mode.
set backspace=indent,eol,start

" Display incomplete commands.
set showcmd

" Display completion matches in a status line.
set wildmenu

" Wait up to 50ms before timing out on Esc/<Leader>.
set ttimeout
set ttimeoutlen=50

" Show a few lines of context around the cursor.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
    set incsearch
endif

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

augroup vimStartup
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif

augroup END

" }}}

" =============================================================================
" General {{{
" Settings that apply to most files. Some of these are taken/modified from
" https://github.com/tpope/vim-sensible/
" =============================================================================

if has('nvim')
    " Pythons 2 and 3 (macOS HomeBrew locations).
    let g:python_host_prog  = '/usr/local/opt/python@2/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'

    " Show the effects of a command incrementally, as you type.
    set inccommand=nosplit
endif

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" I find swapfiles to be more trouble than they're worth.
set noswapfile

" Always insert spaces instead of tabs, use 4 spaces by default.
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Follow indentation of the previous line.
set autoindent

" When at 3 spaces and I hit '>>' go to 4 not 5.
set shiftround

" Don't add two spaces after puctuation when joining lines.
set nojoinspaces

" Delete comment character when joining commented lines.
set formatoptions+=j

" Use a more natural split layout of below and to the right.
set splitbelow
set splitright

" Never been big on code folding.
set nofoldenable

" Keep a lot of lines of command-line history.
set history=1000

" Allow a lot of tabs to be opened via `vim -p`
set tabpagemax=50

" Save undo history.
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Set the leader key to space.
let mapleader = " "

" Set <leader>c to clear search highlighting.
noremap <leader>c :noh<cr>

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Automatically resize splits when the parent window size changes
autocmd VimResized * wincmd =

" }}}

" =============================================================================
" Plugins {{{
" =============================================================================

call plug#begin('~/.vim/plugged')

" Appearance
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

" Fuzzy file finder.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'w0rp/ale'

"Plug 'Valloric/YouCompleteMe', {
"\   'do': './install.py --clang-completer --rust-completer'
"\}

" Language server support.
" Plug 'natebosch/vim-lsc'

" Python
Plug 'ambv/black'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

call plug#end()

" }}}

" =============================================================================
" Appearance {{{
" =============================================================================

" Enable 24-bit color.
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Gruvbox dark color scheme.
set background=dark
let g:gruvbox_italic='1'
colorscheme gruvbox

" Show all wonky whitespace by default.
set list
set listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:+

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

" Use a patched version of Source Code Pro with additional glyphs.
" brew cask install homebrew/cask-fonts/font-source-code-pro-for-powerline
let g:airline_powerline_fonts = 1

" Don't show collapsed sections.
let g:airline_skip_empty_sections = 1

" }}}

" =============================================================================
" Search {{{
" =============================================================================

" Use case-insensitive search.
set ignorecase

" Use case-sensitive search if the expression contains a capital letter.
set smartcase

" Highlight matches.
set hlsearch

" Show all matches.
set showmatch

" Clear highlighting when opening a file.
autocmd BufReadCmd set nohlsearch

" Use ripgrep as my grep if available.
if executable('rg')
    set grepprg=rg\ --vimgrep
endif

" Add a `:Rg` command that searches the buffer using `grepprg`. Bind that
" command to `\` for convenience.
if !exists(":Rg")
    command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Rg<SPACE>
endif

" Bind K to grep word under cursor.
nnoremap K :Rg <C-R><C-W><CR>

" }}}

" =============================================================================
" FZF {{{
" =============================================================================

" As an ex-`ctrlp.vim` user, bind CTRL-P to opening buffers with fzf.
nnoremap <C-p> :Files<CR>

" The preview window should take up the bottom 20% of the screen.
let g:fzf_layout = { 'down': '~20%' }

" Customize fzf colors to match the color scheme.
let g:fzf_colors = {
\   'fg':      ['fg', 'Normal'],
\   'bg':      ['bg', 'Normal'],
\   'hl':      ['fg', 'Comment'],
\   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\   'hl+':     ['fg', 'Statement'],
\   'info':    ['fg', 'PreProc'],
\   'border':  ['fg', 'Ignore'],
\   'prompt':  ['fg', 'Conditional'],
\   'pointer': ['fg', 'Exception'],
\   'marker':  ['fg', 'Keyword'],
\   'spinner': ['fg', 'Label'],
\   'header':  ['fg', 'Comment']
\}

" Command to generate tags file.
let g:fzf_tags_command = 'ctags --fields=+l -R'

" }}}

" =============================================================================
" Completion & Languages {{{
" =============================================================================

set completeopt=menu,menuone,longest,preview

let g:ycm_python_binary_path = 'python3'

let g:ale_completion_enabled = 1

let g:ale_open_list = 0

let g:ale_linters_explicit = 1

let g:ale_linters = {
\   'python': ['pyls'],
\   'rust': ['rls'],
\}

" LSP servers (http://langserver.org/).
let g:lsc_server_commands = {
\   'c':      'cquery',
\   'cpp':    'cquery',
\   'go':     'go-langserver',
\   'python': 'pyls',
\	'rust':   'rls',
\ }

" Format Rust files on save.
let g:rustfmt_autosave = 1

" Use <tab> to complete suggestions.
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

" }}}
