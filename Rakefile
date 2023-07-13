def recursive_symlink(path, target)
  if File.directory?(path)
    system "mkdir -p #{target}"
    Dir["#{path}/*"].each do |source|
      recursive_symlink(source, target)
    end
  else
    file = File.join(File.dirname(__FILE__), path)
    system "ln -sf #{file} #{target}"
  end
end

# Symlink config files
desc 'Symlink all config files'
task :default => [:vim, :dot]

desc 'Symlink vim folder'
task :vim do
  p 'Symlinking vim home'
  system "mkdir -p ~/.vim"
  Dir['vim/*'].each do |path|
    target = '~/.' + path
    recursive_symlink(path, target)
  end
end

desc 'Symlink dot files'
task :dot do
  p 'Symlinking dot files'
  Dir['dotfiles/*'].each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/.#{name}")
    system "rm -rf #{target}"
    system "ln -s #{path} #{target}"
  end
end



desc 'Inital setup'
task :initial_setup do
  [:homebrew, :ohmyzsh].each do |t|
    Rake::Task[t].invoke(t)
  end
end

desc 'Install homebrew'
task :homebrew do
  # TOOD: choose packages
  #gettext
  #libevent node  sqlite wrk boost hostscript libffi openjpeg tesseract wxmac cairo lib libpng openssl python object-introspection libtiff pcre rabbitmq doxygen raphviz libtool perl tmux zsh-completions erlang highlight libyaml phantomjs readline tnef fontconfig htop little-cms2 pixman redis tree freetype imagemagick lua pkg-config unrar gd jpeg mysql poppler gdbm leptonica nmap postgresql94 siege webp asciidoc icu4c zeromq docbook ghostscript ucl docbook-xsl git upx glib gnu-getopt postgresql gobject-introspection xmlto zsh
  system 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  system 'brew install rbenv pstree qt the_silver_searcher rabbitmq redis elasticsearch vim tig ctags puma-dev xz tmux'
  system 'brew cask install caffeine google-chrome iterm2 pgadmin4 atom'
end

desc 'Install ohmyzsh'
task :ohmyzsh do
  system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
end




desc 'Install vim-plug'
task :plug do
  system 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
end

desc 'Install vim-gtk for vim clipboard support'
task :vimgtk do
  system 'sudo apt-get instal vim-gtk'
  # TODO: install used applications
end


