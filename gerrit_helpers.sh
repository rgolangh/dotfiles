#! /bin/sh 

GERRIT_URL=https://gerrit.ovirt.org

function gerrit.change_id() {
  git show  --shortstat  | grep Change-Id | gawk '{print $2}'
}

function gerrit.related.change_id() {
  curl -s ${GERRIT_URL}/changes/$(gerrit.change_id)/revisions/current/related | sed '1d' | jq '.[][0] | .commit.commit' | tr -d '"'
}

function gerrit.related.remote_branch() {
  git ls-remote -q | grep $(gerrit.related.change_id) | gawk '{print $2}'
}

function gerrit.remote_branch() {
  git ls-remote -q | grep $(git rev-parse HEAD) | gawk '{print $2}'
}

