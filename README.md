# Minimal Bash Dotfiles for Mac
This repository is for my dotfiles. Feel free to pull and customize as you wish. Pull requests are welcome also!

## Installation

I am now using Ansible to manage all of this.

```sh
brew install ansible

# Also install zsh because its better than all the things.
brew install zsh

echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
```

Clone the repo and run the bootstrap script.

```sh
cd $HOME
git clone https://github.com/rvalente/dotfiles.git .dotfiles
cd .dotfiles
./run.sh
```
