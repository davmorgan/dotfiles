# Minimal Bash Dotfiles for Mac
This repository is for my dotfiles. Feel free to pull and customize as you wish. Pull requests are welcome also!

## Installation

I use RCUP for symlinking the dotfiles to their respective locations.

```sh
brew tap thoughtbot/formulae
brew install rcm

# Also install bash from this century
brew install bash bash-completion

echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
```

Now once RCUP is installed, clone the repo down to `.dotfiles` and run rcup.

```sh
cd $HOME
git clone https://github.com/rvalente/dotfiles.git .dotfiles
rcup
```
