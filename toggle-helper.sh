#!/bin/bash -ex

# a generic implementation of a toggle pattern. The calling script
# must call its main function 'app' and declare a trap command
# to kill all child processes.
#
# function app() {
#     trap 'kill $(jobs -p)' EXIT
#     ...code
# }
#
function toggle() {
	pid=/var/run/user/${UID}/$(basename ${0}).pid
	if [ -f $pid ];then
		kill -TERM $(cat $pid) || true
		rm $pid
		return
	fi
	( app "$@" ) &
	echo $! > $pid
}

