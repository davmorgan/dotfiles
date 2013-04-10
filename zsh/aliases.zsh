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

# Cisco Console using only Screen
alias con='screen /dev/tty.KeySerial1'

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
