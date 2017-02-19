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

# test functions
find-pid() {
  ps aux | grep $1 | awk '{print $2}'
}

test() {
  grep $1
}

kill-all() {
  kill $1
}

kill9-all() {
  kill -9 $1
}
