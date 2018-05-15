" ==============================================================================
" General: {{{
" ==============================================================================
if has('nvim')
    let g:python_host_prog  = '/usr/local/opt/python@2/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

let mapleader = " "

" Set <leader>c to clear search highlighting.
noremap <leader>c :noh<cr>

" Automatically resize splits when the parent window size changes
autocmd VimResized * wincmd =

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set nobackup                    " Don't make a backup before overwriting a file.
set nowritebackup               " And again.
set noswapfile                  " Don't use swapfiles.
set hidden                      " Don't kill unwritten buffers when hidden.

set tabstop=4                   " Global tab width.
set shiftwidth=4                " And again, related.
set shiftround                  " Round tabs to a multiple of shiftwidth.
set expandtab                   " Use spaces instead of tabs.
set wrap                        " Turn on line wrapping.
set nojoinspaces                " Don't add two spaces after punctuation when joining lines.

" More natural split layout.
set splitbelow
set splitright

" Always draw the sign column. This prevents the buffer from moving when
" adding/deleting signs (e.g. gitgutter, RLS).
set signcolumn=yes
" }}}

" ==============================================================================
" Plugins: {{{
" ==============================================================================
call plug#begin('~/.vim/plugged')

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Language server support (http://langserver.org/).
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" lang#c
Plug 'arakashic/chromatica.nvim', {'merged': 0}

" lang#python
Plug 'heavenshell/vim-pydocstring',   {'for': 'python'}
Plug 'vimjas/vim-python-pep8-indent', {'for': 'python'}

" lang#go
Plug 'fatih/vim-go',      {'for': 'go', 'loadconf_before' : 1}

" lang#ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

" lang#rust
Plug 'rust-lang/rust.vim',   {'for': 'rust', 'merged' : 1}
Plug 'cespare/vim-toml'

" lang#tmux
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}

" lang#zsh
Plug 'chrisbra/vim-zsh',   {'for': 'zsh'}
Plug 'zchee/deoplete-zsh', {'for': 'zsh'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Appearance
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" ----
" Misc
" ----

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" Sensible default settings
Plug 'tpope/vim-sensible'

" Language agnostic testing support
Plug 'janko-m/vim-test'

" Work with Xcode projects from inside Vim
Plug 'gfontenot/vim-xcode'

" Easily comment code
Plug 'tpope/vim-commentary'

" Allow . to make plugin actions repeat
Plug 'tpope/vim-repeat'

" Surround text objects with characters
Plug 'tpope/vim-surround'

" Project specific configurations
Plug 'tpope/vim-projectionist'

" Automatically create non-existent directories
Plug 'pbrisbin/vim-mkdir'

" Rename files in place
Plug 'pbrisbin/vim-rename-file'

" Run command for interpreted files
Plug 'pbrisbin/vim-runfile'

" Easily copy to the system clipboard
Plug 'christoomey/vim-system-copy'

" Perform sort operations on text objects
Plug 'christoomey/vim-sort-motion'

" Remember last position in files
Plug 'dietsche/vim-lastplace'

" Highlight yanks.
Plug 'machakann/vim-highlightedyank'

" Visualize registers when trying to paste info from them.
Plug 'junegunn/vim-peekaboo'

call plug#end()
" }}}

" ==============================================================================
" Appearance: {{{
" ==============================================================================

" 24-bit color.
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Gruvbox dark.
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

set textwidth=80        " Prefer 80-character columns because I'm old.
set colorcolumn=+1      " Highlight the 81st character column.
set relativenumber      " Use relative line numbers.
set number              " Show the current line number
set cursorline          " Highlight the current line.
set noshowmode          " Don't show '--INSERT--' in the modeline

let g:lightline = {
\   'colorscheme': 'gruvbox',
\   'active': {
\       'right': [
\           ['fugitive'],
\           ['fileformat', 'fileencoding', 'filetype', 'lineinfo'],
\       ]
\   },
\   'inactive': {
\       'right': []
\   },
\   'component_function': {
\       'fugitive': 'LightLineFugitive'
\   }
\}

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" }}}

" ==============================================================================
" Spellcheck: {{{
" ==============================================================================
set spellfile=~/.vim/spell/en.utf-8.add

augroup spellcheck
    autocmd!
    autocmd VimEnter * execute "silent mkspell! " . &spellfile
augroup END
" }}}

" ==============================================================================
" Undo: {{{
" ==============================================================================
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
" }}}

" ==============================================================================
" Search: {{{
" ==============================================================================
set gdefault           " Default to global substitutions on lines.
set ignorecase         " Case-insensitive searching.
set smartcase          " But case-sensitive if expression contains a capital letter.
set hlsearch           " Highlight matches.
set showmatch          " Show all matches.

if has('nvim')
    " Interactive search & replace
    set inccommand=nosplit
endif

" Clear highlighting when opening a file.
autocmd BufReadCmd set nohlsearch

" Use Ripgrep over Grep.
if executable('rg')
    set grepprg=rg\ --vimgrep
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

if !exists(":Rg")
  command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Rg<SPACE>
endif

" bind K to grep word under cursor.
nnoremap K :Rg <C-R><C-W><CR>

" Move the search term to the middle of the screen if the screen has changed
" position.
" Stolen from @keith:
" https://github.com/keith/dotfiles/commit/20f98a645dd9ebcd24fa96d3aac0e9fe34a21a6a
" https://github.com/keith/dotfiles/commit/38822fd4353909177ea8e49649156531736596e4
function! s:NextAndCenter(cmd)
  let view = winsaveview()

  try
    execute "normal! " . a:cmd
  catch /^Vim\%((\a\+)\)\=:E486/
    " Fake a 'rethrow' of an exception without causing a 3 line error message
    echohl ErrorMsg
    echo "E486: Pattern not found: " . @/
    echohl None
  endtry

  if view.topline != winsaveview().topline
    normal! zzzv
  endif
endfunction

nnoremap <silent> n :call <SID>NextAndCenter('n')<CR>
nnoremap <silent> N :call <SID>NextAndCenter('N')<CR>
" }}}

" ==============================================================================
" Completion: {{{
" ==============================================================================
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*/.git/*
set completeopt=menu,menuone,longest,preview

" Enable deoplete automatically.
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" Close the scratch window.
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" CTRL-P tab-completion
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

" Language server support.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'c': ['cquery'],
    \ 'cpp': ['cquery'],
    \ 'go': ['go-langserver'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }

nnoremap <silent> H  :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> rn :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> fm :call LanguageClient#textDocument_formatting()<CR>

" Rust
let g:rustfmt_autosave = 1
" }}}

" ==============================================================================
" Testing: {{{
" ==============================================================================
let test#strategy = 'vtr'

" Add keybindings for test actions
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tT :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
" }}}

" ==============================================================================
" Tmux: {{{
" ==============================================================================
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
let g:VtrGitCdUpOnOpen = 1

nnoremap <leader>r :VtrSendCommandToRunner!<space>

nnoremap <leader>ar :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>rr :VtrSendCommandToRunner! !!<cr>
" }}}

" ==============================================================================
" Ctags: {{{
" ==============================================================================
command! Ctags call s:generate_ctags()

function! s:generate_ctags()
  call system("git ls-files | ctags --fields=+l -L -")
endfunction
" }}}

" Python
nmap <silent> <C-_> <Plug>(pydocstring)

" ==============================================================================
" Xcode: {{{
" ==============================================================================
let g:xcode_runner_command = 'VtrSendCommandToRunner! {cmd}'
let g:xcode_xcpretty_testing_flags = '--test'

nnoremap <leader>b :Xbuild<CR>
nnoremap <leader>u :Xtest<CR>
" }}}

" TODO: move these into auto files
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType cs setlocal commentstring=//\ %s
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.uplugin set filetype=json

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
