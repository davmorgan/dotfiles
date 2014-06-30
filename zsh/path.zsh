export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH:/usr/local/opt/go/libexec/bin"
if [ -d "/Applications/VMware Fusion.app/Contents/Library" ]; then
  export PATH="/Applications/VMware Fusion.app/Contents/Library:$PATH"
fi
export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"
