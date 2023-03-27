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

if type -q exa
    alias ls "exa -l --icons -h -m -u"
    alias ll "exa --header --long --tree --level=3 -a -m -u"
end

# set the editor of choice
set -gx EDITOR /usr/bin/nvim
set -gx GIT_EDITOR /usr/bin/nvim

# command colors
set fish_color_valid_path white --underline
set fish_color_quote green

