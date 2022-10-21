#!/bin/bash -ex

# a generic implementation of a toggle pattern. The calling script
# should pass the function name as the first argument and declare a trap command
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
	    toggle::cleanup
		return
	fi

	( $1 ) &

	if (( $? == 0 )); then
		echo $! > $pid
	fi
}


function toggle::cleanup() {
	 rm /var/run/user/${UID}/$(basename ${0}).pid || true
 }
