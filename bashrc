# --- Source global definitions --- #

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# --- Functions ------------------- #

# Check for uncommited git changed
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

# Get git branch name
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

# Reload bashrc
function resource() {
    source ~/.dotfiles/bashrc
}

# Git Checkout w/ re-source to show branch name
function gco () {
    git checkout "$@" && resource
}

# Run builtin cd command with an parameters, re-source after
function cd () {
    builtin cd "$@" && resource
}

# --- Customize Bash Prompt ------- #

PS1="\n\[\033[0;33m\][\h] - [\w]\[\033[0m\] \[\033[0;34m\]$(parse_git_branch)\n\[\033[1;36m\]\u \[\033[0;31m\]-> \[\033[0m\]"

# --- Color Vars ------------------ #

export CLICOLOR=1
export TERM=xterm-color

# --- Editor ---------------------- #

export EDITOR=vim

# --- Paths ----------------------- #

PATH=${PATH}:/usr/local/bin:/usr/local/mysql/bin

# --- Aliases --------------------- #

alias lsl='ls -ahlT'
alias g='git'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
#alias gco='git checkout'
alias ga='git add .'
alias mkdir='mkdir -p'
