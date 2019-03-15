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
  export master_branch=master
  export staging_branch=staging
  export current_branch=$(git rev-parse --abbrev-ref HEAD)
  export number_of_commits=$(git log master..$current_branch --pretty=oneline | wc -l | sed 's/ //g')
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
ppr() {
  repo=`git config --get remote.origin.url | sed 's/\.git$//' | cut -d':' -f2-`
  current_branch=`git rev-parse --abbrev-ref HEAD`
  echo "https://github.com/$repo/compare/$current_branch"
}

oc() {
  repo_path=`git rev-parse --show-toplevel`
  repo=`basename $repo_path`
  open "https://github.com/receipt-bank/$repo/commit/$1"
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
  ag '^Host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf --height 10% | xargs -o ssh
}
