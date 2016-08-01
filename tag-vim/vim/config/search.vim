set gdefault                      " Default to global substitutions on lines.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set hlsearch                      " Highlight matches.
set showmatch                     " Show all matches.
autocmd BufReadCmd set nohlsearch " On opening the file, clear search-highlighting.

" Use Ag over Grep.
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore.
let g:ctrlp_user_command = 'ag -Q --files-with-matches --hidden --nocolor -g "" %s'

" ag is fast enough that CtrlP doesn't need to cache.
let g:ctrlp_use_caching = 0

" Map Gr directly to \ for speed
nnoremap \ :Ag<SPACE>

" bind K to grep word under cursor
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