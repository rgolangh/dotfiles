#!/bin/sh

function enginecurl () 
{ 
    local uri=$1;
    shift;
    curl -s -u admin@internal:123 -H "All-Content: true" -H "Accept: application/json" $@ http://localhost:8080/ovirt-engine/api/$uri
}
