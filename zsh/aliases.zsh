# vimrc editing
alias ve='vim ~/.vimrc'
alias vi='vim'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias mkdir='nocorrect mkdir'

# /bin/ls aliases
alias ls='ls -G'
alias la='ls -aG'
alias ll='ls -lahG'
alias lsg='ll | grep'
alias lh='ls -alt | head'

# Other Common Commands
alias df='df -h'
alias du='du -h -d 2'
alias tf='tail -f'
alias cl='clear'
alias cls='clear;ls'
alias zmv="noglob zmv -W"

# Netstat
alias ns='sudo netstat -plant | grep LISTEN'

# PS Aliases
alias ps="/bin/ps auxf"
alias psg="/bin/ps aux | grep "
alias p='ps -fu $USER'
alias j='jobs -l'
alias h='history'

# Git Aliases
alias git='noglob git'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias ga='git add .'
alias gall='git add -A'
alias gc='git commit'
alias gca='git commit -a'
alias gcv='git commit -v -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'

# Hub
alias
eval "$(hub alias -s)"

alias brewu="brew update && brew upgrade --all && brew doctor && brew cleanup"
alias latexmk='latexmk -pdf -pvc'
alias flushdns='sudo killall -HUP mDNSResponder'

# Include custom aliases
[[ -f ~/.aliases ]] && source ~/.aliases
