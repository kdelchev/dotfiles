dot_files = Dir['dotfiles/*']
bin_files = Dir['bin/*']

task :dot_files do
  p 'Symlinking dotfiles'
  dot_files.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/.#{name}")
    system "rm -rf #{target}"
    system "ln -s #{path} #{target}"
  end
end

task :bin_files do
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

task :plug do
  system 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
end

task :default => [:dot_files, :bin_files, :plug]
