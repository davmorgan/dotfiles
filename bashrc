#!/bin/bash

export TERM='xterm-256color'
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Load Git Awesomeness
source $(brew --prefix)/etc/bash_completion
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Setup Git Prompt Variables
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

prompt () {
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local BCYAN="\[\033[1;36m\]"
  local BLUE="\[\033[0;34m\]"
  local GRAY="\[\033[0;37m\]"
  local DKGRAY="\[\033[1;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[0;31m\]"
  local YELLOW="\[\033[0;33m\]"
  local MAGENTA="\[\033[0;35m\]"
  local DEFAULT="\[\033[0m\]"

  export PS1="$DEFAULT[$BLUE\u$DEFAULT@$YELLOW\h$DEFAULT][$GREEN\w$DEFAULT]$YELLOW\$(__git_ps1 \" ($CYAN%s$YELLOW)\") \n$MAGENTA\$$DEFAULT "
}

PROMPT_COMMAND=prompt

source $HOME/.bash_aliases

# GoLang Support
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
