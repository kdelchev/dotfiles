dot_files = Dir['dotfiles/*']
bin_files = Dir['bin/*']

desc 'Symlink dotfiles'
task :dotfiles do
  p 'Symlinking dot files'
  dot_files.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/.#{name}")
    system "rm -rf #{target}"
    system "ln -s #{path} #{target}"
  end
end

desc 'Symlink binary files'
task :binfiles do
  p 'Symlinking bin files'
  bin_files.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    # NB: this could be system specific path
    target = File.expand_path("/usr/local/bin/#{name}")
    # TODO: add confirmation before remove
    system "rm #{target}" if File.exists?(target)
    system "ln -s #{path} #{target}"
  end
end

desc 'Install vim-plug'
task :plug do
  system 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
end

desc 'Install ohmyzsh'
task :ohmyzsh do
  system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
end

desc 'Install rbenv'
task :rbenv do
  system 'git clone https://github.com/rbenv/rbenv.git ~/.rbenv'
  system 'cd ~/.rbenv && src/configure && make -C src'
  # TODO: check if the SHELL is bash or zsh and apply PATH for the specific
  # profile
  system 'echo \'export PATH="$HOME/.rbenv/bin:$PATH"\' >> ~/.profile'
end

desc 'Install vim-gtk for vim clipboard support'
task :vimgtk do
  system 'sudo apt-get instal vim-gtk'
  # TODO: install used applications
end

desc 'Install homebrew and OSX applications'
task :homebrew do
  system 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  system 'brew install qt the_silver_searcher rabbitmq redis elasticsearch vim rbenv ruby-build openssl tig ctags'
  system 'brew cask install caffeine google-chrome iterm2 pgadmin4 atom'
end
