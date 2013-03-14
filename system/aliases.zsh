if $(gls &>/dev/null); then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias sr='ssh -Y -lroot'
alias s='ssh -R 52698:localhost:52698 -ladministrator'
alias nx='ssh -ladmin'
alias ns='netstat -lant | grep LISTEN'
alias con='screen /dev/tty.KeySerial1'
