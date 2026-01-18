# --- Source global definitions --- #

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# --- Additional Config ----------- #

DOTFILES="$HOME/.dotfiles"

[[ -f "$DOTFILES/bash/functions" ]] && source "$DOTFILES/bash/functions"
[[ -f "$DOTFILES/bash/aliases" ]]   && source "$DOTFILES/bash/aliases"

# --- Customize Bash Prompt ------- #
# [robot-node-04] - [~/Documents/Projects/misc/dotfiles] (master*)
# chris ->

# PS1="\n\[\033[0;33m\][\h] - [\w]\[\033[0m\] \[\033[0;34m\]$(parse_git_branch)\n\[\033[1;36m\]\u \[\033[0;31m\]-> \[\033[0m\]"
PS1="\n\
\[\033[0;33m\][\h] - [\w]\[\033[0m\] \
\[\033[0;34m\]\$(parse_git_branch)\n\
\[\033[1;36m\]\u \
\[\033[0;31m\]-> \
\[\033[0m\]"

# --- Colors ---------------------- #

export CLICOLOR=1
export TERM="xterm-256color"

# --- Editor ---------------------- #

export EDITOR=vim

# --- Paths ----------------------- #

add_to_path() {
  [[ -d "$1" && ":$PATH:" != *":$1:"* ]] && PATH="$PATH:$1"
}

add_to_path "/usr/local/bin"                # Intel Homebrew
add_to_path "/opt/homebrew/bin"             # Apple Silicon Homebrew
add_to_path "$HOME/.composer/vendor/bin"

export PATH

# --- NVM ------------------------- #

if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix)"

  export NVM_DIR="$HOME/.nvm"
  [[ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ]] && source "$BREW_PREFIX/opt/nvm/nvm.sh"
  [[ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]] \
    && source "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi

# --- Fastfetch ------------------- #

# Show system info on interactive shells
if [[ $- == *i* ]]; then
    fastfetch
fi

