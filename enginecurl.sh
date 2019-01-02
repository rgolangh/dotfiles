#!/bin/sh

export ENGINE_URL=https://localhost:28443
export ENGINE_USER_PASS=admin@internal:123

function enginecurl () 
{ 
    local uri=$1;
    shift;
    curl -k -s -u ${ENGINE_USER_PASS} -H "All-Content: true" -H "Accept: application/json" -H "Content-Type: application/json" $@ ${ENGINE_URL}/ovirt-engine/api/$uri
}

function token() {
	curl -k \
	   	--data "grant_type=password&scope=ovirt-app-api&username=admin@internal&password=123" \
		-H "Accept: application/json" -H "Content-Type: application/x-www-form-urlencoded" \
		$ENGINE_URL/ovirt-engine/sso/oauth/token
}
