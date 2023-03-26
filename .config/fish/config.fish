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

# set alias for ls -a
alias ls "ls -a"

# set the editor of choice
set -gx EDITOR /usr/bin/nvim
set -gx GIT_EDITOR /usr/bin/nvim

# replacement of nvm
set -Ux FNM_DIR "$HOME/.fnm"
source "$FNM_DIR/fnm.fish"

# yarn PATH
set -gx PATH $PATH /usr/local/share/.config/yarn/global/node_modules/.bin

