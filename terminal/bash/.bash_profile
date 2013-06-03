#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it



# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='/usr/bin/mate -w'

# Load Bash It
#source $BASH_IT/bash_it.sh
source ~/.mybash/.bashrc
