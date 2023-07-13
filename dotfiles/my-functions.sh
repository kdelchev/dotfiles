if (command -v ag &> /dev/null); then
  ag-in-project () {
    git --no-pager grep "$@"
    ag "$@" `bundle show --paths`
  }

  ag-vim() {
    ag $1 | vim - -c "set hlsearch" -c "/$1"
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

# find . -name *.slim | xargs git diff --

# Opens changed files in the last $1 commits
# Exmaple: vim-last 2
vim-last() {
  vim `git diff HEAD~$1 --name-only`
}

squash-commits() {
  #!/bin/bash

  export remote=origin
  export master_branch=main
  export staging_branch=staging
  export current_branch=$(git rev-parse --abbrev-ref HEAD)
  export number_of_commits=$(git log main..$current_branch --pretty=oneline | wc -l | sed 's/ //g')
  export squash_branch=squash_$(date +%Y%m%d%H%M%S)

  # Create squash branch $squash_branch
  git checkout -b $squash_branch &> /dev/null

  # Squash commits
  git reset --soft HEAD~$number_of_commits &> /dev/null
  git commit -am "Squash commit of branch $current_branch" &> /dev/null
  export squash_commit=$(git rev-parse HEAD)

  # Return to branch
  git checkout $current_branch &> /dev/null

  # Copy the commit to clipboard
  echo $squash_commit | pbcopy

  # Print commit SHA
  echo "Squashed into $squash_commit"
}

# Print Pull Request
oppr() {
  open `ppr`
}

ppr() {
  repo=`git config --get remote.origin.url | sed 's/\.git$//' | cut -d':' -f2-`
  current_branch=`git rev-parse --abbrev-ref HEAD`
  echo "https://github.com/$repo/compare/$current_branch"
}

grho() {
  current_branch=`git rev-parse --abbrev-ref HEAD`
  `git reset origin/$current_branch --hard`
}

oc() {
  # git remote get-url origin                                                                                     1 ↵
  # git@github.com:receipt-bank/application.git

  repo=`git config --get remote.origin.url | sed 's/\.git$//' | cut -d':' -f2-`
  open "https://github.com/$repo/commit/$1"
}

vim-line() {
  a=$1
  vim +${a#*:*} ${a%:*}
}

alias kuberun='kubectl -n ${NS:-globe} exec -ti $(kubepods | fzf | sed "s/pods\///g")'
alias kubepods='kubectl get pods -a -n ${NS:-globe} -o name'
alias kubeget='kubectl -a -n ${NS:-globe} get'
alias kubelogs='kubepods | fzf | xargs kubectl -n ${NS:-globe} logs --tail=500 --timestamps -f'
alias kubedesc='kubepods | fzf | xargs kubectl -n ${NS:-globe} describe'
alias kubessh='kuberun bash'
alias k='kubectl -n ${NS:-globe}'

ns() {
  export NS=$(kubectl get ns -o name | sed "s/namespaces\///g" | fzf)
}

# description "Fuzzy-find ssh host and ssh into it"
fssh() {
  rg '^Host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf --height 10% | xargs -o ssh
}

ct() {
  ctags -R -f ./.git/tags .
}

staging-tunnel() {
  scalingo --app staging db-tunnel $SCALINGO_POSTGRESQL_URL
}

dump-staging-db() {
  pg_dump --clean --if-exists --format c --dbname $DATABASE_URL --no-owner --no-privileges --no-comments --exclude-schema 'information_schema' --exclude-schema '^pg_*' --file ~/Downloads/dump.pgsql
}

disconnect-db() {
  psql -d postgres -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'development';"
  psql -d postgres -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'test';"
}

import-staging-db() {
  # psql -d postgres -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'development';"
  disconnect-db
  DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:drop db:create
  pg_restore --clean --if-exists --no-owner --no-privileges --no-comments --dbname postgres://localhost:5432/development ~/Downloads/dump.pgsql
}
