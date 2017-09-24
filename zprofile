# ============================================================================
# Browser {{{
# ============================================================================

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# }}}

# ============================================================================
# Editors {{{
# ============================================================================

export VISUAL='/usr/local/bin/nvim'
export EDITOR="$VISUAL"
export PAGER='less'

# }}}

# ============================================================================
# Language {{{
# ============================================================================

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# }}}

# ============================================================================
# Paths {{{
# ============================================================================

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

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
# Less {{{
# ============================================================================

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

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
