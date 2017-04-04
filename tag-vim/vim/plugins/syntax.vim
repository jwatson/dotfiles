" Syntax checking hacks.
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/indentpython.vim'

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_python_binary_path = 'python' " Use the first Python in $PATH (handy for virtualenvs)
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use ESLint to check Javascript.
let g:syntastic_javascript_checkers = ['eslint']

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current fileset statusline+=%#warningmsg#
