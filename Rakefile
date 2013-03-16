require 'rake'

task :default => [:install]

desc "Install Dotfiles"
task :install => [:submodule_init, :submodules] do
  install_homebrew if RUBY_PLATFORM.downcase.include?("darwin")
  install_fonts if RUBY_PLATFORM.downcase.include?("darwin")

  Rake::Task['gitconfig'].invoke
  Rake::Task['pathogen'].invoke

  file_operation(Dir.glob('git/**/*.symlink'))
  file_operation(Dir.glob('ruby/**/*.symlink'))
  file_operation(Dir.glob('system/**/*.symlink'))
  file_operation(Dir.glob('zsh/**/*.symlink'))
  dir_operation(Dir.glob('bin'))
  dir_operation(Dir.glob('.vim'))

  # Get the Active Shell and Update Not ZSH
  active_shell = %x(echo $SHELL)
  change_shell unless active_shell.include?("zsh")

  puts "[\e[32mSuccess\e[0m] Dotfiles Installed! Please close all open terminals."
end

desc "Update Dotfiles"
task :update do
  run %{ git pull }
  Rake::Task['pathogen'].invoke
  puts "[\e[32mSuccess\e[0m] Dotfiles Updated! Please close all open terminals."
end

desc "Update Pathogen"
task :pathogen do
  run %{ curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim }
end

task :cwd do
  puts Dir.pwd
end

desc "Setup Git Config"
task :gitconfig do
  unless File.exist?("#{Dir.pwd}/git/gitconfig.symlink")
    puts "gitconfig Does Not Exists"
    printf "Enter Git Author Name: "
    git_author_name = STDIN.gets.chomp
    printf "Enter Git Author Email: "
    git_author_email = STDIN.gets.chomp

    run %{ sed -e "s/GIT_AUTHOR_NAME/#{git_author_name}/g" -e "s/GIT_AUTHOR_EMAIL/#{git_author_email}/g" git/gitconfig.symlink.example > git/gitconfig.symlink }
  end
end

task :submodule_init do
  run %{ git submodule update --init --recursive 2>&1 }
end

desc "Init and update submodules."
task :submodules do
    run %{ cd $HOME/.dotfiles 2>&1
           git submodule foreach 'git fetch origin; git checkout master; git reset --hard origin/master; git submodule update --recursive; git clean -dfx' 2>&1
           git clean -dfx 2>&1 }
end

private
def run(cmd)
  puts "[\e[38;5;136mRunning\e[0m] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    run %{ ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)" }
  end

  install_packages
end

def install_packages
  run %{ brew install ack ctags git hub grc coreutils spark nmap bash-completion tmux fping proctools wget}
end

def install_fonts
  run %{ cp -f $HOME/.dotfiles/fonts/* $HOME/Library/Fonts }
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
  if system('type -f /usr/local/bin/zsh')
    run %{ chsh -s /usr/local/bin/zsh }
    puts "[\e[32mChanged\e[0m] Active ZSH Shell is: #{`which zsh`}"
  else
    run %{ chsh -s /bin/zsh }
    puts "[\e[32mChanged\e[0m] Active ZSH Shell is: #{`which zsh`}"
  end
end
