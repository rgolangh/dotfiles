#!/bin/sh

export ENGINE_URL=http://localhost:28080

function enginecurl () 
{ 
    local uri=$1;
    shift;
    curl -s -u admin@internal:123 -H "All-Content: true" -H "Accept: application/json" $@ ${ENGINE_URL}/ovirt-engine/api/$uri
}
