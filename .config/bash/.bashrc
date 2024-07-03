#!/usr/bin/env bash
# Bash related
case $- in
*i*) ;;
*) return ;;
esac

# dont' put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# Eternal Bash History
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history

#######################################################
# EXPORTS
#######################################################

# Will have an old session history when starting a new terminal instead of overwriting
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == '1' ]] && stty -ixon

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias nano='edit'
alias vim='nvim'

# Have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

# Check if ripgrep is installed
if command -v rg &> /dev/null; then
    # Alias grep to rg if ripgrep is installed
    alias grep='rg'
else
    # Alias grep to /usr/bin/grep with GREP_OPTIONS if ripgrep is not installed
    alias grep="/usr/bin/grep $GREP_OPTIONS"
fi
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Path to the bash it configuration
export BASH_IT="/home/raven/.bash_it"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh

# Git Bare
alias dot="git -C $HOME --git-dir=$HOME/.dotfiles --work-tree=$HOME"

#######################################################
# GENERAL ALIASES
#######################################################

# Edit .bashrc file using nvim
alias vibrc="edit ~/.config/bash/.bashrc"

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# Show the date alias
alias today='date "+%m-%d-%Y %A %T %Z"'
alias ls="ls -a --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color"

# Alias's for multiple directory listing commands
alias la='ls -Alh'                # show hidden files alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -ltcrh'              # sort by change time
alias lu='ls -lturh'              # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              # alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias lla='ls -Al'                # List and Hidden Files
alias las='ls -A'                 # Hidden Files
alias lls='ls -l'                 # List

# Search command line history
alias h="history | grep "

# Starship Cross-Shell Prompt
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
