if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

# Setup EDITOR/VISUAL/PAGER
export EDITOR='/usr/bin/vim'
export VISUAL=$EDITOR
export PAGER='less -m'

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

if [ -e /usr/share/terminfo/78/xterm-256color ]; then
  export TERM='xterm-256color'
fi

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export HISTCONTROL=erasedups
export HISTTIMEFORMAT='%F %T '
export SAVEHIST=10000

setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases
