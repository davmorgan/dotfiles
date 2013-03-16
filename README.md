# Dotfiles (For ZSH)
This repository is for my dotfiles. Feel free to pull and customize as you wish. Pull requests are welcome also!

## Installation
Installation is quite easy, you just need to pull the repo and run rake.

```sh
cd $HOME
git clone https://github.com/rvalente/dotfiles.git .dotfiles
cd .dotfiles
rake
```

This will setup your .gitconfig, install all the necessary submodules for git, and backup all your existing files.

### Rakefile Details
There are some options in the Rakefile to allow for easy updating to fixing a broken setup.

```sh
rake gitconfig   # Setup Git Config
rake install     # Install Dotfiles
rake pathogen    # Update Pathogen
rake submodules  # Init and update submodules.
rake update      # Update Dotfiles
```

Run `rake install` at any time to recreate symlinks, pull fonts back in, pull the latest pathogen, and updated submodules.

If you just want to update your repo, then just run `rake update`. This will run a git pull and also download the latest pathogen file.

```sh
cd $HOME/.dotfiles
git pull
curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
```

### ZSH Setup

The Rakefile will check if you are running ZSH. If your `$SHELL` variable does not `include?(zsh)` then it will run the change_shell method. This method will check to see if you have installed ZSH from homebrew (recommended). If ZSH is installed via homebrew then we will use that `/usr/local/bin/zsh`, if not then we will use the default OSX ZSH install `/bin/zsh`.

```ruby
# Get the Active Shell and Update Not ZSH
active_shell = %x(echo $SHELL)
change_shell unless active_shell.include?("zsh")

def change_shell
  puts "\n === [\e[0;37mBootstrap Default Shell\e[0m] ==="
  if system('type -f /usr/local/bin/zsh')
    run %{ chsh -s /usr/local/bin/zsh }
    puts "[\e[0;35mChanged\e[0m]  Active ZSH Shell is: #{`which zsh`}"
  else
    run %{ chsh -s /bin/zsh }
    puts "[\e[0;35mChanged\e[0m]  Active ZSH Shell is: #{`which zsh`}"
  end
end
```

### Credit
Thank you to Zach Holman for many great ideas and his OCD-level implementation style/technique.
