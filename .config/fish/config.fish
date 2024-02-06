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

# set the editor of choice
set -gx EDITOR /usr/bin/nvim
set -gx GIT_EDITOR /usr/bin/nvim

# command colors
set fish_color_valid_path white --underline
set fish_color_quote green

# git prompt settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_dirtystate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_conflictedstate "+"
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_cleanstate green --bold
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_branch cyan --dim --italics

#tmux colors
alias tmux='tmux -2'

# java
#set -gx JAVA_HOME "/usr/lib/jvm/java-11-openjdk-amd64/bin/java"
#set -gx JAVA_HOME="/usr/lib/jvm/jdk-17"
#set -gx PATH=$PATH:$JAVA_HOME/bin
#set -x JAVA_HOME /usr/lib/jvm/jdk-17/bin/java
set -gx JAVA_HOME /usr/lib/jvm/jdk-17

# spring
set -gx PATH $PATH ~/Downloads/spring-3.0.6/bin/

# intellij
set PATH /path/to/intellij/bin $PATH
alias idea='idea'

# Gradle Build tool
set -gx GRADLE_HOME /opt/gradle/gradle-7.4.2
set -gx PATH $GRADLE_HOME/bin $PATH
