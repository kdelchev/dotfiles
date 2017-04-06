if (command -v ag &> /dev/null); then
  ag-in-project () {
    git --no-pager grep "$@"
    ag "$@" `bundle show --paths`
  }
fi

calc-stats() {
  #" Set the spec file that tests will be run for.
  find . -name '*.rb' | xargs wc -
}

# Find process(es) PID
find-all() {
  ps aux | grep $1 | awk '{print $2}'
}

kill-all() {
  find-all $1 | xargs kill --
}

kill9-all() {
  find-all $1 | xargs kill -9 --
}

puma-log() {
  tail -f /Users/kdelchev/Library/Logs/puma-dev.log
}
# find . -name *.slim | xargs git diff --
