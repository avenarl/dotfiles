#!/usr/bin/env bash

case $- in
  *i*) ;;
    *) return;;
esac

# dont' put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Path to the bash it configuration
export BASH_IT="/home/raven/.bash_it"

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh

# Git Bare
alias dot="git -C $HOME --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Aliases
alias vim='nvim'
alias bashy='nvim ~/.config/bash/.bashrc'
alias ls="ls -a --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color"

# Eternal Bash History
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history

# Starship Cross-Shell Prompt
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
