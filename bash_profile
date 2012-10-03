#!/bin/bash


# Detect what platform we're running on so that we can handle BSD/GNU
# differences gracefully.
PLATFORM="unknown"
uname=$(uname)
if [[ "$uname" == "Linux" ]]; then
    PLATFORM="linux"
elif [[ "$uname" == "Darwin" ]]; then
    PLATFORM="macos"
fi
export PLATFORM

# Activate my virtualenv.
[[ -s ~/.venv/bin/activate ]] && source ~/.venv/bin/activate

# Enable RVM
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

# Source ~/.bashrc if it exists.
[[ -s ~/.bashrc ]] && source ~/.bashrc
