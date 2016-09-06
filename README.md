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

## ZSH Dotfile Overview

* `.zshenv` is always sourced, add exported variables that should be available to other programs. IE: $PATH, $EDITOR, $PAGER.


* `.zshrc` is for interactive shell configuration. You set options for the interactive shell there with the setopt and unsetopt commands. You can also load shell modules, set your history options, change your prompt, set up zle and completion, et cetera. You also set any variables that are only used in the interactive shell (e.g. $LS_COLORS).


* `.zprofile` is basically the same as .zlogin except that it's sourced directly before .zshrc is sourced instead of directly after it. According to the zsh documentation, ".zprofile is meant as an alternative to `.zlogin' for ksh fans; the two are not intended to be used together, although this could certainly be done if desired."

* `.zlogout` is sometimes used to clear and reset the terminal.
