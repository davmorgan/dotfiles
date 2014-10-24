#!/usr/bin/env zsh

#
# Variables
#
DOTFILES="$HOME/.dotfiles"
BREW='/usr/local/bin/brew'
PKGS=( hg ansible ctags docker ack spark asciidoc graphviz fop wget fping nmap vim jshon rbenv ruby-build git zsh ag sysdig tmux reattach-to-user-namespace )
BUNDLE_DIR="$HOME/.vim/bundle"

#
# Pre Script Logic
#

# Start Off Script
echo "     TBL Dotfiles"
echo "======================"
printf "\nScript will begin in 3 seconds"
for s in 1 2 3; do
  printf "."
  sleep 1
done

# Check for ZSH, Set as Default if not.
if [ ! -n "$ZSH_VERSION" ]; then
  if [ ! -s /usr/local/bin/zsh ]; then
    chsh -s /bin/zsh
  else
    chsh -s /usr/local/bin/zsh
  fi
fi

# Check for Homebrew, Install if not.
if [ ! -f $BREW ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Now that Homebrew is installed, install cask
if [ ! -f $CASK ]; then
  brew install caskroom/cask/brew-cask
fi

#
# Functions
#
osx_defaults() {
  printf "Fast Key Repeat..."
  defaults write NSGlobalDomain KeyRepeat -int 0
  if [ $? -eq 0 ]; then
    printf " SUCCEEDED"
  else
    printf " FAILED"
  fi
}

install() {
  $BREW install $1
}

pull() {
  if [ -d $DOTFILES ]; then
    cd $DOTFILES && git pull
  fi
}

link_file() {
  # Split the Path
  a=(${(s:/:)i})

  # Get Last Element of the Array and strip off the .symlink
  symlink=$a[-1]
  b=(${(s:.:)symlink})

  # Source is the Argument
  link_source=$i

  # Target is anything ending in .symlink, with that stripped off and a . added
  link_target="$HOME/.$b[1]"

  echo "\n === [\e[0;37mLinking $link_target\e[0m] ==="
  if [ -L $link_target ]; then
    return 1
  elif [ -f $link_target ]; then
    mv $HOME/$link_target $HOME/$link_target.bak || return 2
  fi
  ln -nfs $link_source $link_target
  return $?
}

link_dir() {
  # Split the Path
  a=(${(s:/:)i})

  # Get Last Element of the Array and strip off the .symlink
  symlink=$a[-1]
  b=(${(s:.:)symlink})

  # Source is the Argument
  link_source=$i

  # Target is anything ending in .symlink, with that stripped off and a . added
  link_target="$HOME/$b[1]"

  echo "\n === [\e[0;37mLinking $link_target\e[0m] ==="
  if [ -L $link_target ]; then
    return 1
  elif [ -d $link_target ]; then
    echo "$link_target: already exists as a dir, backing up..."
    mv $HOME/$link_target $HOME/$link_target.bak || return 2
  fi

  # Now finally... link
  ln -nfs $link_source $link_target
  return $?
}

neobundle() {
	mkdir -p $BUNDLE_DIR

	if [ ! -d $BUNDLE_DIR/neobundle.vim ]; then
		git clone https://github.com/Shougo/neobundle.vim $BUNDLE_DIR/neobundle.vim
	else
		git pull
	fi
}

fonts() {
  for i in $( ls $DOTFILES/fonts ); do
    if [ ! -s $HOME/Library/Fonts/$i ]; then
      cp $DOTFILES/fonts/$i $HOME/Library/Fonts
    fi
  done
}

#
# Main Logic
#
osx_defaults

# Pull Latest Dotfiles
pull

# Install Fonts if Missing
fonts

# Setup LINK Files/Dirs
LINK_FILES=($DOTFILES/**/*.symlink)
LINK_DIRS=($DOTFILES/bin)

for i in $LINK_FILES; do
  link_file $i
  case "$?" in
  0)
  echo "Linked $i"
  ;;
  1)
  echo "$link_target: already exists as a link, skipping."
  ;;
  2)
  echo "Link Failed"
  exit 1
  ;;
  esac
done

for i in $LINK_DIRS; do
  link_dir $i
  case "$?" in
  0)
  echo "Linked $i"
  ;;
  1)
  echo "$link_target: already exists as a link, skipping."
  ;;
  2)
  echo "Link Failed"
  exit 1
  ;;
  esac
done

neobundle

for i in $PKGS; do
  install $i
done
