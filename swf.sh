#!/bin/bash 

# Sonataflow helper

function swf() {
    url=http://localhost:8080
    uri="${1:-processes/management}"
    shift
    curl --silent -H "Content-Type: application/json" "${url}/${uri}" "$@"
}

function swf.processInstances() {
    swf graphql -d '{"query" : "{ProcessInstances{id variables}}"}'    
}
