# John Watson's Dotfiles

These are the config files I use. I've tried to make things work equally
well on OS X and Linux.

## Installation

You'll want to clone the repo into `~/.dotfiles`:

```sh
$ git clone https://github.com/jwatson/dotfiles .dotfiles
```

Next, run `setup/setup` to install everything, with dependencies.

## rcm

This repo uses [rcm](https://github.com/thoughtbot/rcm) for file management,
which I highly recommend. It also makes use of rcm's tag feature, which allows
you to pull down select parts of the repo if you wish.

If you'd rather just create the directory structure and symlinks instead of
installing Homebrew dependencies too, you can run the following:

```sh
$ rcup -v -d ~/.dotfiles
```

## Acknowledgements

Blatantly stolen from Gordon Fontenote's
[dotfiles](https://github.com/gfontenot/dotfiles), and then customized a bit.
