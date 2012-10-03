#!/bin/bash

### Shell Stuff.

source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/functions

# Don't do anything else if this is not an interactive shell.
[ -z "$PS1" ] && return

# Enable case-insensitive globbing.
shopt -s extglob

# Check the window size after each command and, if necessary, update
# the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

export EDITOR="vim"
export PAGER="less"

# Colorize BSD ls.
if [[ $PLATFORM == "macos" ]]; then
    export CLICOLOR=1
    export LSCOLORS="exgxcxdxcxegedabagacad"
fi

# Tell `grep` to colorize matches.
export GREP_OPTIONS="--color=auto"

### Prompt stuff.

# Define some terminal colors.
C0='\[\033[00m\]'   # default
C1='\[\033[0;33m\]' # yellow
C2='\[\033[0;31m\]' # red
C3='\[\033[0;37m\]' # white
C4='\[\033[0;32m\]' # green
C5='\[\033[0;34m\]' # blue
C6='\[\033[0;37m\]' # white

# Set a color prompt if we're in a compliant terminal.
# All prompts are: (user@host)-(pwd git)
case "$TERM" in
xterm*|linux|ansi|screen)
    PS1='\[\033[0;34m\](\[\033[0;33m\]\u\[\033[0;32m\]@\h\[\033[0;34m\])-(\[\033[0;32m\]\w$(__git_ps1 " \[\033[0;35m\]%s")\[\033[0;34m\])\[\033[00m\]\n\$ '
    ;;

*)
    PS1='(\u@\h)-(\w$(__git_ps1 " %s"))\n\$ '
    ;;
esac

# Set the terminal's title bar to the current working directory.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
    PROMPT_COMMAND="update_terminal_cwd; prompt"
else
    case $TERM in
        xterm*|rxvt*|screen)
            export PROMPT_COMMAND=prompt
            ;;
        *)
            unset PROMPT_COMMAND
            ;;
    esac
fi

### Bash stuff.

# Enable bash completion.
[[ $(which brew) ]] && prefix=$(brew --prefix) || prefix=""
if [ -f $prefix/etc/bash_completion ]; then
    . $prefix/etc/bash_completion
fi

export HISTSIZE=10000

# Don't store duplicate lines in the history.
export HISTCONTROL=ignoreboth

# Append to the history instead of overwriting.
shopt -s histappend
