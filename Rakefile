require 'rake'

task :default => [:install]

desc "Install Dotfiles"
task :install => [:submodule_init, :submodules] do
  install_homebrew if RUBY_PLATFORM.downcase.include?("darwin")
  osx_defaults if RUBY_PLATFORM.downcase.include?("darwin")

  Rake::Task['gitconfig'].invoke
  Rake::Task['pathogen'].invoke

  puts "\n === [\e[0;37mBootstrap Dotfiles\e[0m] ==="
  file_operation(Dir.glob('git/**/*.symlink'))
  file_operation(Dir.glob('ruby/**/*.symlink'))
  file_operation(Dir.glob('system/**/*.symlink'))
  file_operation(Dir.glob('zsh/**/*.symlink'))
  dir_operation(Dir.glob('bin'))
  dir_operation(Dir.glob('.vim'))

  # Get the Active Shell and Update Not ZSH
  active_shell = %x(echo $SHELL)
  change_shell unless active_shell.include?("zsh")

  puts "[\e[0;32mSuccess\e[0m] Dotfiles Installed! Please close all open terminals."
end

desc "Update Dotfiles"
task :update do
  puts "\n === [\e[0;37mUpdating Dotfiles\e[0m] ==="
  run %{ git pull }
  Rake::Task['pathogen'].invoke
  puts "[\e[0;32mSuccess\e[0m] Dotfiles Updated! Please close all open terminals."
end

desc "Update Pathogen"
task :pathogen do
  puts "\n === [\e[0;37mBootstrap Vim Pathogen\e[0m] ==="
  run %{ curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim }
end

desc "Setup Git Config"
task :gitconfig do
  puts "\n === [\e[0;37mBootstrap Git Config\e[0m] ==="
  unless File.exist?("#{Dir.pwd}/git/gitconfig.symlink")
    puts "[\e[0;34mConfig \e[0m]  $HOME/.gitconfig"
    printf "[\e[0;34mConfig \e[0m]  Enter Git Author Name: "
    git_author_name = STDIN.gets.chomp
    printf "[\e[0;34mConfig \e[0m]  Enter Git Author Email: "
    git_author_email = STDIN.gets.chomp

    run %{ sed -e "s/GIT_AUTHOR_NAME/#{git_author_name}/g" -e "s/GIT_AUTHOR_EMAIL/#{git_author_email}/g" git/gitconfig.symlink.example > git/gitconfig.symlink }
  end
end

desc "Initialize Submodules"
task :submodule_init do
  puts "\n === [\e[0;37mBootstrap Submodules\e[0m] ==="
  run %{ git submodule update --init --recursive 2>&1 }
end

desc "Update Submodules"
task :submodules do
  run %{ cd $HOME/.dotfiles 2>&1
         git submodule foreach 'git fetch origin; git checkout master; git reset --hard origin/master; git submodule update --recursive; git clean -dfx' 2>&1
         git clean -dfx 2>&1 }
end

private
def run(cmd)
  puts "[\e[0;33mRunning\e[0m] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_homebrew
  puts "\n === [\e[0;37mBootstrap Homebrew\e[0m] ==="
  run %{ which brew }
  unless $?.success?
    run %{ ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)" }
  end

  install_packages
end

def install_packages
  pkgs = [ "ack", "ctags", "git", "hub", "grc", "spark", "nmap", "tmux", "fping", "proctools", "wget", "mtr", "rbenv", "ruby-build" ]

  pkgs.each do |p|
    if system("brew list | grep #{p} > /dev/null")
      puts "[\e[0;36mNotice \e[0m]  Package: #{p} already installed."
    else
      puts "[\e[0;36mNotice \e[0m]  Installing Package: #{p}."
      run %{ brew install #{p} }
    end
  end
end

def install_fonts
  puts "\n === [\e[0;37mBootstrap Fonts\e[0m] ==="
  run %{ cp -f $HOME/.dotfiles/fonts/* $HOME/Library/Fonts }
end

def osx_defaults
  puts "\n === [\e[0;37mBootstrap OS X\e[0m] ==="
  run %{ $HOME/.dotfiles/bin/osx-defaults }
end

def file_operation(files)
  files.each do |f|
    file = f.split('/').last
    file = file.split('.').first
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      puts "[\e[0;31mBackup \e[0m]  #{target}"
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    run %{ ln -nfs "#{source}" "#{target}" }
  end
end

def dir_operation(dir)
  dir.each do |d|
    source = "#{ENV["PWD"]}/#{d}"
    target = "#{ENV["HOME"]}/#{d}"

    if File.directory?(target)
      puts "[\e[0;31mBackup \e[0m]  #{target}"
      run %{ mv "$HOME/#{d}" "$HOME/#{d}.backup" }
    end

    run %{ ln -nfs "#{source}" "#{target}" }
  end
end

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
