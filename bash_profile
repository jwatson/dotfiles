#!/bin/bash

# Source ~/.bashrc if it exists.
[[ -s ~/.bashrc ]] && source ~/.bashrc

# Load up rbenv if it exists.
if hash rbenv 2>/dev/null; then
    eval "$(rbenv init -)"
fi
