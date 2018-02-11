#!/bin/sh

function repogrep() {
  pushd .
  local term=$1
  shift
  for repo in $@; do
    cd $repo
    git grep $term
    cd -
  done
  popd
}
