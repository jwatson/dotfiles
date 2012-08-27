#!/bin/bash

source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/functions

# Activate my virtualenv.
[[ -s ~/.venv/bin/activate ]] && source ~/.venv/bin/activate

# Enable RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Source ~/.bashrc if it exists.
[[ -s ~/.bashrc ]] && source ~/.bashrc
