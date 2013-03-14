completion=/usr/local/share/zsh/site-functions/_git

if test -f $completion; then
  export FPATH="$completion:$FPATH"
fi
