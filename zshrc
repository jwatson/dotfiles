source /usr/local/opt/zplug/init.zsh

zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2

zplug load

for zsh_source in $HOME/.zsh/config/*.zsh; do
    source $zsh_source
done

ensure_tmux_is_running
