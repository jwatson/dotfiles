let g:python_host_prog = "/usr/local/opt/python@2/bin/python2"
let g:python3_host_prog = "/usr/local/opt/python/bin/python3"

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
