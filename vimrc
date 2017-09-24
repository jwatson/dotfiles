" ============================================================================
" Startup {{{
" ============================================================================

augroup startup
  autocmd!

  " If we launched vim without specifying a target, we want to open the pwd
  autocmd VimEnter * if empty(argv()) | silent! edit . | endif
augroup END

" }}}

" ============================================================================
" Plugins {{{
" ============================================================================

packadd minpac
call minpac#init()

" ===============
" Package manager
" ===============

call minpac#add('k-takata/minpac', {'type':'opt'})

" ==========
" Completion
" ==========

call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('Shougo/neosnippet')
call minpac#add('Shougo/neosnippet-snippets')
call minpac#add('mitsuse/autocomplete-swift')

" ====================
" Languages/Frameworks
" ====================

call minpac#add('rust-lang/rust.vim')
call minpac#add('cespare/vim-toml')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('keith/swift.vim')
call minpac#add('ericpruitt/tmux.vim', {'rtp': 'vim/'})
call minpac#add('fatih/vim-go')

" ==========
" Git/GitHub
" ==========

call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('airblade/vim-gitgutter')

" ====
" Tmux
" ====

call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('christoomey/vim-tmux-runner')

" ==========
" Appearance
" ==========

call minpac#add('lifepillar/vim-solarized8')
call minpac#add('itchyny/lightline.vim')

" ====
" Misc
" ====

" Fuzzy file finder
call minpac#add('ctrlpvim/ctrlp.vim')
" Sensible default settings
call minpac#add('tpope/vim-sensible')
" Asynchronous file linting/formatting
call minpac#add('w0rp/ale')
" Language agnostic testing support
call minpac#add('janko-m/vim-test')
" Work with Xcode projects from inside Vim
call minpac#add('gfontenot/vim-xcode')
" Easily comment code
call minpac#add('tpope/vim-commentary')
" Allow . to make plugin actions repeat
call minpac#add('tpope/vim-repeat')
" Surround text objects with characters
call minpac#add('tpope/vim-surround')
" Project specific configurations
call minpac#add('tpope/vim-projectionist')
" Automatically create non-existent directories
call minpac#add('pbrisbin/vim-mkdir')
" Rename files in place
call minpac#add('pbrisbin/vim-rename-file')
" Run command for interpretd files
call minpac#add('pbrisbin/vim-runfile')
" Easily copy to the system clipboard
call minpac#add('christoomey/vim-system-copy')
" Perform sort operations on text objects
call minpac#add('christoomey/vim-sort-motion')
" Automatically add closing statements for a number of languages
call minpac#add('cohama/lexima.vim')
" Remember last position in files
call minpac#add('dietsche/vim-lastplace')
" Proper python indenting.
call minpac#add('vim-scripts/indentpython.vim')

" }}}

" ============================================================================
" Appearance {{{
" ============================================================================

colorscheme solarized8_dark

set colorcolumn=80      " Highlight the 80 character column.
set relativenumber      " Use relative line numbers.
set number              " Show the current line number
set cursorline          " Highlight the current line.
set noshowmode          " Don't show '--INSERT--' in the modeline

" Display extra whitespace.
" set list listchars=tab:»·,trail:·,nbsp:·

" Status bar.
"set statusline+=%*

let g:lightline = {
\   'colorscheme': 'solarized',
\   'active': {
\       'right': [
\           ['fugitive'],
\           ['fileformat', 'fileencoding', 'filetype'],
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

" ============================================================================
" Functions {{{
" ============================================================================

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Reload our vim config.
command! Reload execute "source $MYVIMRC"

" Toggle markdown checkboxes
function! ToggleCheckbox()
  let current_line = getline('.')
  let cursor_pos = getpos('.')
  if match(current_line, '\V[ ]') >= 0
    exe 's/\V[ ]/[x]/'
  elseif match(current_line, '\V[x]') >= 0
    exe 's/\V[x]/[ ]/'
  endif
  call setpos('.', cursor_pos)
endfunction

" Trim trailing whitespace from files
command! TrimWhitespace call s:trim_whitespace()

function! s:trim_whitespace()
  let l:pos = getpos(".")
  %s/\s\+$//g
  call setpos(".", l:pos)
endfunction

let g:runfile_by_name = {
\   '.*\.m\(ark\)\?d\(own\)\?$': '!open -a "Marked 2" %',
\   '.*\.hs': '!stack ghci %',
\}

" }}}

" ============================================================================
" Keybindings {{{
" ============================================================================

let mapleader = " "

" Set <leader>c to clear search highlighting.
nnoremap <leader>c :noh<cr>

" Tab navigation.
nmap <leader>hh :tabprev<cr>
nmap <leader>ll :tabnext<cr>

nnoremap <leader>. :call ToggleCheckbox()<Cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" }}}

" ============================================================================
" Spellcheck {{{
" ============================================================================
set spellfile=~/.vim/spell/en.utf-8.add

augroup spellcheck
    autocmd!

    " recreate the spelling dictionary at startup
    autocmd VimEnter * execute "silent mkspell! " . &spellfile
  augroup END
augroup END

" }}}

" ============================================================================
" Undo {{{
" ============================================================================

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" }}}

" ============================================================================
" Search/Replace {{{
" ============================================================================

set gdefault    " Default to global substitutions on lines.
set ignorecase  " Case-insensitive searching.
set smartcase   " But case-sensitive if expression contains a capital letter.
set hlsearch    " Highlight matches.
set showmatch   " Show all matches.

" Clear highlighting when opening a file.
autocmd BufReadCmd set nohlsearch

" Use Ag over Grep.
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

if !exists(":Ag")
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" bind K to grep word under cursor.
nnoremap K :Ag <C-R><C-W><CR>

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

" ============================================================================
" Completion {{{
" ============================================================================
set wildmenu
set wildmode=list:longest,list:full
set completeopt=menu,menuone,longest,preview

" Enable deoplete automatically.
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

" neosnippets config.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" }}}

" ============================================================================
" Testing {{{
" ============================================================================

" Use VimTmuxRunner for our testing strategy
let test#strategy = 'vtr'

" Add keybindings for test actions
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tT :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" }}}

" ============================================================================
" ALE {{{
" ============================================================================

let g:ale_linters = {
\ 'cpp': ['clang', 'clang-format'],
\}

" Update Clang options to search for OpenSSL. I'm also relaxing the version
" to C++11 since most of my projects use that.
let g:ale_cpp_clang_options = '-std=c++11 -Wall -I/usr/local/opt/openssl/include'

let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%linter%]: %s'

augroup AleConfig
  autocmd!
  set updatetime=1000
  let g:ale_lint_on_text_changed = 'normal'
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertEnter * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
augroup END

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" }}}

" ============================================================================
" Tmux {{{
" ============================================================================

let g:VtrGitCdUpOnOpen = 1

nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>ar :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>rr :VtrSendCommandToRunner! !!<cr>

nnoremap <leader>r :VtrSendCommandToRunner!

" }}}

" ============================================================================
" Git/GitHub {{{
" ============================================================================

let g:gist_post_private = 1
set stl+=%{ConflictedVersion()}

" }}}

" ============================================================================
" Ctags {{{
" ============================================================================

command! Ctags call s:generate_ctags()

function! s:generate_ctags()
  call system("git ls-files | ctags -L -")
endfunction

" }}}

" ============================================================================
" Xcode {{{
" ============================================================================

let g:xcode_runner_command = 'VtrSendCommandToRunner! {cmd}'
let g:xcode_xcpretty_testing_flags = '--test'

nnoremap <leader>b :Xbuild<CR>
nnoremap <leader>u :Xtest<CR>

" }}}

" ============================================================================
" Javascript {{{
" ============================================================================

let g:jsx_ext_required = 0

" }}}

" ============================================================================
" Markdown {{{
" ============================================================================

" Force *.md as Markdown.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" }}}

" ============================================================================
" Misc {{{
" ============================================================================

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
