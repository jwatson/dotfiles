# To profile zsh:
# ---------------
# - load the zprof module
# - start a new shell
# - run `zprof | less`

## Uncomment to enable profiling.
# zmodload zsh/zprof

source /usr/local/opt/zplug/init.zsh

zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2

zplug load

for zsh_source in $HOME/.zsh/config/*.zsh; do
    source $zsh_source
done

## Set up virtualenvwrapper
#export PIP_USER_DIR="$HOME/Library/Python/3.7"
#export WORKON_HOME="$HOME/.virtualenvs"
#[ -s "$PIP_USER_DIR/bin/virtualenvwrapper.sh" ] && \. "$PIP_USER_DIR/bin/virtualenvwrapper.sh"

ensure_tmux_is_running

