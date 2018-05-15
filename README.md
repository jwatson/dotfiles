# John Watson's Dotfiles

These are the config files I use.

## Installation

You'll want to clone the repo into `~/.dotfiles`:

```sh
$ git clone https://github.com/jwatson/dotfiles .dotfiles
```

Normally, you'd run `setup/setup` to install everything, with dependencies. That
definitely doesn't work any more.

## rcm

This repo uses [rcm](https://github.com/thoughtbot/rcm) for file management.

```sh
$ rcup -v -d ~/.dotfiles
```
