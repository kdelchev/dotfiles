export PATH=~/bin:$PATH # https://gist.github.com/kdelchev/530ab8bf90ab5fe1f0758d3c2b7d4507
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export EDITOR=vim

# Allow [ or ] whereever you want; https://github.com/thoughtbot/dotfiles/blob/master/zshrc#L43
unsetopt nomatch

# Do not share history between tabs
unsetopt share_history

alias a='alias'

[[ -r ~/.passwords ]] && . ~/.passwords

# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"

#LDFLAGS:  -L/usr/local/opt/openssl/lib
#CPPFLAGS: -I/usr/local/opt/openssl/include
