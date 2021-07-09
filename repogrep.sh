#!/bin/sh -e

function repogrep() {
  pushd .
  for repo in $(find . -maxdepth 1 -type d); do
    if [[ -d "$repo/.git" ]];then
      cd "$repo"
      git grep --full-name "$1"
      cd -
    fi
  done
  popd
}
