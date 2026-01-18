# --- Source global definitions --- #

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# --- Additional Config ----------- #

source ~/.dotfiles/bash/aliases
source ~/.dotfiles/bash/functions

# --- Customize Bash Prompt ------- #
# [robot-node-04] - [~/Documents/Projects/misc/dotfiles] (master*)
# chris ->

PS1="\n\[\033[0;33m\][\h] - [\w]\[\033[0m\] \[\033[0;34m\]$(parse_git_branch)\n\[\033[1;36m\]\u \[\033[0;31m\]-> \[\033[0m\]"

# --- Colors ---------------------- #

export CLICOLOR=1
export TERM=xterm-color

# --- Editor ---------------------- #

export EDITOR=vim

# --- Paths ----------------------- #

PATH=${PATH}:/usr/local/bin:~/.composer/vendor/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/bash_completion" ] && \. "$(brew --prefix nvm)/bash_completion"

