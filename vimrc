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
set scrolloff=1

" Do incremental searching when it's possible to timeout.
if has('reltime')
    set incsearch
endif

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

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

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Appearance
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

" Fuzzy file finder.
Plug 'ctrlpvim/ctrlp.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Asynchronous file linting/formatting.
Plug 'w0rp/ale'

" Languages/frameworks.
Plug 'keith/swift.vim'
Plug 'mitsuse/autocomplete-swift'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'

"if has('nvim')
    " Clang-based syntax highlighting for C-family languages.
"    Plug 'arakashic/chromatica.nvim'
"endif

" Easily comment code.
Plug 'tpope/vim-commentary'

" Highlight yanked lines.
Plug 'machakann/vim-highlightedyank'

" Intelligently reopen files at your last position.
Plug 'farmergreg/vim-lastplace'

" Automatically add closing statements for a number of languages
Plug 'cohama/lexima.vim'

" Surround text with quotes, etc.
Plug 'tpope/vim-surround'

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
" let g:airline_skip_empty_sections = 1

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
" CtrlP {{{
" =============================================================================

" Ignore git directories.
set wildignore+=*/.git/*

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" =============================================================================
" Completion & Languages {{{
" =============================================================================

set completeopt=menu,menuone,longest,preview

let g:ycm_python_binary_path = 'python3'

let g:ale_completion_enabled = 1

let g:ale_fix_on_save = 1

let g:ale_open_list = 0

let g:ale_linters_explicit = 1

let g:ale_linters = {
\   'cpp': ['cquery'],
\   'typescript': ['tsserver'],
\   'python': ['pyls'],
\   'rust': ['rls'],
\   'sh': ['shellcheck'],
\}

let g:ale_fixers = {
\   'cpp': ['clang-format'],
\   'python': ['black'],
\   'rust': ['rustfmt'],
\}

" Format Rust files on save.
let g:rustfmt_autosave = 1

let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'

let g:chromatica#enable_at_startup=1

" Markdown in comments will be formatted.
let g:markdown_fenced_languages = [
\   'rust'
\ , 'python'
\ , 'swift'
\ , 'ruby'
\ , 'sh'
\ , 'yaml'
\ , 'objc'
\ , 'haskell'
\ ]

" Use <tab> to complete suggestions.
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

" CocoaPods files are Ruby.
autocmd BufNewFile,BufRead Podfile,*.podspec setfiletype ruby

" Insert markdown-formatted top-level header with today's date.
nnoremap <leader>d "=strftime("# %A, %B %e, %Y")<CR>P

" Redraw the screen when things get pooched.
nnoremap <leader>rd :redraw!<CR>

" }}}
