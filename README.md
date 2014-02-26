# Dotfiles (For ZSH)
This repository is for my dotfiles. Feel free to pull and customize as you wish. Pull requests are welcome also!

## Installation
Installation is quite easy, you just need to pull the repo, run bundler, and then run rake.

```sh
cd $HOME
git clone https://github.com/rvalente/dotfiles.git .dotfiles
cd .dotfiles
bundle install
rake
```

This will setup your .gitconfig, install all the necessary submodules for git, and backup all your existing files.

## Updating Brew
I have now included a whenever task to run brew update each day to ensure you have the latest brew package info.

```sh
cd ~/.dotfiles
whenever -w
```

### Credit
Thank you to Zach Holman for many great ideas and his OCD-level implementation style/technique.
