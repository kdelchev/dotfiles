export PATH=/Users/kode/bin:$PATH # https://gist.github.com/kdelchev/530ab8bf90ab5fe1f0758d3c2b7d4507
export PATH=$PATH:$HOME/.rvm/bin # Add RVM for scripting
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin # Postgres.app binaries
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home" # Javaaaaa :)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Allow [ or ] whereever you want; https://github.com/thoughtbot/dotfiles/blob/master/zshrc#L43
unsetopt nomatch

# Do not share history between tabs
unsetopt share_history

alias a='alias'

[[ -r ~/.passwords ]] && . ~/.passwords


LDFLAGS:  -L/usr/local/opt/openssl/lib
CPPFLAGS: -I/usr/local/opt/openssl/include
