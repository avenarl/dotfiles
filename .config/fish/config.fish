if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g -x PATH /usr/local/bin $PATH

# set alias for tracking of dotfiles
alias dot="git --git-dir=$HOME/.config --work-tree=$HOME"

# honor for vim
alias vim "nvim" 

# when updating the config of fish
alias fishy "nvim ~/.config/fish/config.fish"
