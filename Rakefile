require 'rake'

task :default => [:install]

desc "Deploy Dotfiles"
task :install => [:submodule_init, :submodules] do
  install_homebrew if RUBY_PLATFORM.downcase.include?("darwin")
  install_fonts if RUBY_PLATFORM.downcase.include?("darwin")

  Rake::Task['gitconfig']
  Rake::Task['pathogen']

  file_operation(Dir.glob('git/**/*.symlink'))
  file_operation(Dir.glob('irb/**/*.symlink'))
  file_operation(Dir.glob('ruby/**/*.symlink'))
  file_operation(Dir.glob('ctags/**/*.symlink'))
  file_operation(Dir.glob('system/**/*.symlink'))
  file_operation(Dir.glob('zsh/**/*.symlink'))
  dir_operation(Dir.glob('functions'))
  dir_operation(Dir.glob('bin'))
  dir_operation(Dir.glob('.vim'))
end

desc "Update Pathogen"
task :pathogen do
  run %{curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim}
end

desc "Setup Git Config"
task :gitconfig do
    printf "Enter Git Author Name: "
    git_author_name = STDIN.gets.chomp
    printf "Enter Git Author Email: "
    git_author_email = STDIN.gets.chomp

    run %{
      sed -e "s/GIT_AUTHOR_NAME/#{git_author_name}/g" -e "s/GIT_AUTHOR_EMAIL/#{git_author_email}/g" git/gitconfig.symlink.example > git/gitconfig.symlink
    }
end

task :submodule_init do
  run %{ git submodule update --init --recursive }
end

desc "Init and update submodules."
task :submodules do
    run %{
      cd $HOME/.dotfiles
      git submodule foreach 'git fetch origin; git checkout master; git reset --hard origin/master; git submodule update --recursive; git clean -dfx'
      git clean -dfx
    }
end

private
def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    run %{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
  end

  run %{brew install ack ctags git hub grc coreutils spark nmap bash-completion tmux fping proctools wget}
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
      puts "[Backup] #{target} to #{target}.backup"
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    run %{ ln -nfs "#{source}" "#{target}" }
  end
end

def dir_operation(dir)
  source = "#{ENV["PWD"]}/#{dir}"
  target = "#{ENV["HOME"]}/#{dir}"

  puts "Source: #{source}"
  puts "Target: #{target}"

  if File.exists?(target) || File.symlink?(target)
    puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
    run %{ mv "$HOME/#{dir}" "$HOME/#{dir}.backup" }
  end

  run %{ ln -nfs "#{source}" "#{target}" }
end
