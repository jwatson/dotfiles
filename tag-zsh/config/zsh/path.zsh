path=( "/usr/bin" "/bin" "/usr/sbin" "/sbin" )
path=( "$HOME/.fastlane/bin" "$HOME/.local/bin" "/usr/local/bin" "/usr/local/sbin" $path)
path=( $(go env GOPATH)/bin $path)
path=( "$HOME/.cargo/bin" $path)

export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"
