## Ensure that path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

## Note for macOS: /etc/zprofile totally fucks up your path; I moved mine to
## /etc/zprofile~orig, YMMV.
path=(
    $HOME/.local/bin
    $HOME/.poetry/bin
    $HOME/Library/Python/3.7/bin
    $HOME/.cargo/bin
    $HOME/go/bin
    /usr/local/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
)

## Select only paths that exist.
path=($^path(N))

if [[ -z "$LANG" ]]; then
    export LANG="en_US.UTF-8"
fi
