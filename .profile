export PATH=$PATH:$HOME/.rvm/bin # Add RVM for scripting
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin # Postgres.app binaries
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home" # Javaaaaa :)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Allow [ or ] whereever you want; https://github.com/thoughtbot/dotfiles/blob/master/zshrc#L43
unsetopt nomatch

alias a='alias'

[[ -r ~/.passwords ]] && . ~/.passwords
