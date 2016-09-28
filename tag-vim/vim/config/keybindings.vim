let mapleader = " "

" Map <leader><leader> to switch to previous file
nnoremap <leader><leader> <c-^>

" Set <leader>c to clear search highlighting
nnoremap <leader>c :noh<cr>

" Tab navigation
nmap <leader>hh :tabprev<cr>
nmap <leader>ll :tabnext<cr>

" Pasting
nnoremap <leader>sp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>
