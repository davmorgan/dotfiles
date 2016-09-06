# Minimal Bash Dotfiles for Mac

This repository is for my dotfiles. Feel free to pull and customize as you wish. Pull requests are welcome also!

## Prerequisites

My dotfiles assume that you have [Homebrew](http://brew.sh/) installed. If you do not, then please install that right away.

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once installed you can proceed with the installation/setup of the dotfiles.

## Installation

Ansible is used to put all the things in their right place. If you do not have ansible, go ahead and install it. You can do that a multitude of ways. For details head over to the [Ansible Installation](http://docs.ansible.com/ansible/intro_installation.html) page.

```sh
# Easy: use Homebrew to install the latest stable package.
brew install ansible

# Medium: use Python/Pip to install Ansible.
brew install python
pip install -U ansible

# Also install zsh because its better than all the things.
brew install zsh zsh-syntax-highlighting zsh-completions

# Now ensure your Mac is configured to use the new shell.
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
```

Clone the repo and run the bootstrap script.

```sh
cd $HOME
git clone https://github.com/rvalente/dotfiles.git .dotfiles
cd .dotfiles
./run.sh
```

## ZSH Dotfile Overview

* `.zshenv` is always sourced, add exported variables here.
* `.zshrc` is for **interactive** shells only.

### Load Order

```
.zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login]
```

Credit: http://unix.stackexchange.com/a/71258
