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
alias gpd='git config user.email "john@photodojo.org"'
alias gdt='git difftool'
alias gs='git status | cowsay -f bong -W 120 | lolcat -p 1'
alias lh='ls -sh'
alias c='clear'

# Alias hub to git.
eval "$(hub alias -s)"

# Can't quit you, baby.
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Werk.
alias vpn="sudo openconnect --base-mtu 1400 -u john.watson --authgroup 2 --csd-wrapper ~/.cisco/csd-wrapper.sh https://bn-sslvpn.nuance.com"

# }}}

# ============================================================================
# fzf {{{
# ============================================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
