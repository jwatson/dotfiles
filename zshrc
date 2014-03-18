# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jwatson"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew gem git npm tmux vi-mode virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="~/.rbenv/shims:~/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Add NPM modules to the path if it is installed.
[[ -s /usr/local/share/npm ]] && export PATH="$PATH:/usr/local/share/npm/bin"

# Add Heroku to the path if the toolbelt is installed.
[[ -s /usr/local/heroku ]] && export PATH="$PATH:/usr/local/heroku/bin"

export EDITOR='vim'

# Colorize BSD ls.
export CLICOLOR=1
export LSCOLORS="exgxcxdxcxegedabagacad"

# Disable the prompt munging when activating a virtualenv.
export VIRTUAL_ENV_DISABLE_PROMPT="1"

eval "$(rbenv init -)"