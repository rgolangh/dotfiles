#!/bin/sh

export BZ_URL=https://bugzilla.redhat.com

function bz() { 
    local uri=$1;
    shift;
    curl \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      "$@" \
      "${BZ_URL}/rest/$uri?api_key=${BUGZILLA_API_KEY}"
}

function bz_remove_me_from_cc {
	bz bug/$1 -XPUT -d '{"cc": {"remove": ["rgolan@redhat.com"]}}'
}
