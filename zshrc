# ============================================================================
# Prezto {{{
# ============================================================================

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# }}}

# ============================================================================
# TTY {{{
# ============================================================================

# Disable flow control commands (keeps C-s from freezing everything).
stty start undef
stty stop undef

# }}}

# ============================================================================
# Colors {{{
# ============================================================================

CLICOLOR=1
LSCOLORS="exgxcxdxcxegedabagacad"

# }}}

# ============================================================================
# Aliases {{{
# ============================================================================

alias bc='bc -lq'
alias lh='ls -sh'
alias c='clear'

# Git
eval "$(hub alias -s)"
alias gpd='git config user.email "john@photodojo.org"'
alias gdt='git difftool'
alias gs='git status | cowsay -f bong -W 120 | lolcat -p 1'
alias gwip="git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m \"– WIP –\""
alias gunwip='git log -n 1 | grep -q -c "– WIP –" && git reset HEAD~1'
alias gign='git ls-files --others --ignored --exclude-standard'

# Can't quit you, baby.
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# }}}

# ============================================================================
# fzf {{{
# ============================================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# }}}

# ============================================================================
# asdf {{{
# ============================================================================

[ -e $HOME/.asdf ] && source $HOME/.asdf/asdf.sh

# }}}

# ============================================================================
# tmux {{{
# ============================================================================

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

# }}}
