# Reload zshrc
alias reload!='. ~/.zshrc'

# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'

# Let .. move us up one directory.
alias ..='cd ..'

# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias ls='ls -G'
alias du='du -h -d 2'
alias lsg='ll | grep'

# SSH Aliases
alias sr='ssh -Y -lroot'
alias s='ssh -R 52698:localhost:52698 -ladministrator'
alias nx='ssh -ladmin'

# Netstat
alias ns='netstat -lant'
alias listen='netstat -lant | grep LISTEN'

# Whats My IP?
alias extip='curl ipecho.net/plain ; echo'

# KeySpan Console using only Screen
alias con='screen /dev/tty.KeySerial1'

# Cisco USB Console using only Screen
alias ccon="screen /dev/tty.usbmodem1421"

# PS Aliases
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Copy Public Key to Clipboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Common shell functions
alias less='less -mr'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Sublime Text
alias s3='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias s2='/Applications/Sublime\ Text 2.app/Contents/SharedSupport/bin/subl'

# Razor Aliases
alias ra='razor -u calo-rtp-razor:8080/api'

# Ansible Aliases
alias av='ansible-vault edit'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# Git
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
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gitk="/usr/bin/wish $(which gitk)"

# Ruby
alias b='bundle exec'
alias bi='bindle install'
alias bu='bundle update'
