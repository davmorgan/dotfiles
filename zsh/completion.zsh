# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

# Load the site functions provided by homebrew packages
completion=/usr/local/share/zsh/site-functions

if test -d $completion; then
  export FPATH="$completion:$FPATH"
fi
