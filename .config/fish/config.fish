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
end

# set the editor of choice
set -gx EDITOR /usr/bin/nvim
set -gx GIT_EDITOR /usr/bin/nvim

# tide theme
set -g tide_git_bg_color 268bd2
set -g tide_git_bg_color_unstable C4A000
set -g tide_git_bg_color_urgent CC0000
set -g tide_git_branch_color 000000
set -g tide_git_color_branch 000000
set -g tide_git_color_conflicted 000000
set -g tide_git_color_dirty 000000
set -g tide_git_color_operation 000000
set -g tide_git_color_staged 000000
set -g tide_git_color_stash 000000
set -g tide_git_color_untracked 000000
set -g tide_git_color_upstream 000000
set -g tide_git_conflicted_color 000000
set -g tide_git_dirty_color 000000
set -g tide_git_icon 
set -g tide_git_operation_color 000000
set -g tide_git_staged_color 000000
set -g tide_git_stash_color 000000
set -g tide_git_untracked_color 000000
set -g tide_git_upstream_color 000000
set -g tide_pwd_bg_color 444444


