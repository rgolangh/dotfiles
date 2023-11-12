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
        process_group_id=$(ps --no-headers -o pgid:1 -p $(cat $pid))
        kill -TERM -${process_group_id} || true
		toggle::cleanup
		return
	fi

	( trap 'toggle::cleanup' EXIT && $1 ) &

	if (( $? == 0 )); then
		echo $! > $pid
	fi
}


function toggle::cleanup() {
	 rm /var/run/user/${UID}/$(basename ${0}).pid || true
}


