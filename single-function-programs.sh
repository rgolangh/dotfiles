#!/bin/bash -e

function infect() {
  ssh-copy-id $1
  ssh $1
}

function ticker() {
  curl -s https://api.coindesk.com/v1/bpi/currentprice.json | jq ' .chartName, .bpi.USD.rate '
}

phone () {
    rhuser $1 rhatPhoneExt | awk '/^rhatPhoneExt/ {print $2}'
}

rhuser () {
    local ldapuserid=$1;
    shift;
    ldapsearch -x -h ldap.corp.redhat.com -b "ou=users,dc=redhat,dc=com" "uid=$ldapuserid" $@
}

function toJava10() {
  java -jar ~/src/ToJava10/target/toJava10.jar "$@"
}

function awkprint() {
  awk "\'{$@}\'"
}

