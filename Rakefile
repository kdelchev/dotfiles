dotfiles = Dir['dotfiles/*']

task :dotfiles do
  p 'Symlinking dotfiles'
  dotfiles.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/.#{name}")
    system "rm -rf #{target}"
    system "ln -s #{path} #{target}"
  end
end

task :default => [:dotfiles]
