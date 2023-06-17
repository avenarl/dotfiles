if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# set the editor of choice
set -gx EDITOR /usr/bin/nvim
set -gx GIT_EDITOR /usr/bin/nvim

# command colors
set fish_color_valid_path white --underline
set fish_color_quote green

#tmux colors
alias tmux='tmux -2'

# java
#set -gx JAVA_HOME="/usr/lib/jvm/jdk-17"
#set -gx PATH=$PATH:$JAVA_HOME/bin

# spring
set -gx PATH $PATH ~/Downloads/spring-3.0.6/bin/

# intellij
set PATH /path/to/intellij/bin $PATH
alias idea='idea'
