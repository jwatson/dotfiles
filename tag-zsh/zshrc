# ============================================================================
# Path {{{
# ============================================================================

path=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    $(go env GOPATH)/bin
    "$HOME/.fastlane/bin"
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/local/sbin"
    "/usr/sbin"
    "/sbin"
)

# ============================================================================
# Oh My ZSH {{{
# ============================================================================

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jwatson"

plugins=(gem git git-prompt golang marked2 npm tmux vi-mode better-virtualenv)
source $ZSH/oh-my-zsh.sh

# }}}

# ============================================================================
# TTY {{{
# ============================================================================

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# }}}

# ============================================================================
# Editor/Colors {{{
# ============================================================================

export VISUAL="/usr/local/bin/nvim"
export EDITOR="$VISUAL"

export CLICOLOR=1
export LSCOLORS="exgxcxdxcxegedabagacad"

# }}}

# ============================================================================
# Aliases {{{
# ============================================================================

alias bc='bc -lq'
alias gpd='git config user.email "john@photodojo.org"'
alias gdt='git difftool'
alias gs='git status | cowsay -f bong -W 120 | lolcat -p 1'
alias lh='ls -sh'
alias vpn="sudo openconnect --base-mtu 1400 -u john.watson --authgroup 2 --csd-wrapper ~/.cisco/csd-wrapper.sh https://bn-sslvpn.nuance.com"
alias c='clear'

# Alias hub to git.
eval "$(hub alias -s)"

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
# Functions {{{
# ============================================================================

function eviscerateDerivedData
{
    local derivedDataPath="$HOME/Library/Developer/Xcode/DerivedData"
    rm -rf "$derivedDataPath"
    echo "Deleted $derivedDataPath"
}

function purgeZeroLengthFilesInDerivedData
{
    find ~/Library/Developer/Xcode/DerivedData -name "*.o" -size 0 | xargs rm
}

# }}}

# ============================================================================
# Language Tooling {{{
# ============================================================================

# ####
# Rust
# ####

export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

# ####
# Ruby
# ####

if [[ -e /usr/local/opt/chruby ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

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
