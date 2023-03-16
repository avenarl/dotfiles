if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g -x PATH /usr/local/bin $PATH

# set alias for tracking of dotfiles
alias config="git --git-dir=$HOME/.config --work-tree=$HOME"
