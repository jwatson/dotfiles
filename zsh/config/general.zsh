## Smart URLs.
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

## Combine zero-length punctuation characters (e.g. accents) with the base
## character.
setopt COMBINING_CHARS

## Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
## generation
setopt EXTENDED_GLOB

## Make globbing case-insensitive.
unsetopt CASE_GLOB

## Disable start/stop characters in shell editor.
unsetopt FLOW_CONTROL

export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"

## Treat these characters as part of a word.
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

## Default Less options.
export LESS='-F -g -i -M -R -S -w -X -z-4'

## Set the Less input preprocessor.
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# Use neovim as a man pager.
export MANPAGER="nvim -c 'set ft=man' -"

export RUSTFLAGS="-C target-cpu=native"
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

. $HOME/.asdf/asdf.sh
