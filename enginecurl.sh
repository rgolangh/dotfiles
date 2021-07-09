#!/bin/sh

function enginecurl () 
{ 
	local uri=$1;
	shift;
	curl -k -s -u "${ENGINE_USER}":"${ENGINE_PASS}" -H "All-Content: true" -H "Accept: application/json" -H "Content-Type: application/json" "$@" "${ENGINE_URL}"/ovirt-engine/api/"$uri"
}

function token() {
	curl -k \
		--data "grant_type=password&scope=ovirt-app-api&username=${ENGINE_USER}&password=${ENGINE_PASS}" \
		-H "Accept: application/json" -H "Content-Type: application/x-www-form-urlencoded" \
		"$ENGINE_URL"/ovirt-engine/sso/oauth/token
	}
