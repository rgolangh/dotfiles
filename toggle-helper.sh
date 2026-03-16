#!/bin/bash -ex

# a generic implementation of a toggle pattern. The calling script
# should pass the function name as the first argument and declare a trap command
# to clean up resources and kill all child processes.
#
# function app() {
#     trap 'my_cleanup; kill 0 2>/dev/null' EXIT
#     ...code
# }
#
function toggle() {
	pid=/var/run/user/${UID}/$(basename ${0}).pid
	if [ -f $pid ];then
        process_group_id=$(ps --no-headers -o pgid:1 -p $(cat $pid)) || true
        if [ -n "$process_group_id" ];then
            kill -TERM -${process_group_id} || true
            sleep 2
            kill -9 -${process_group_id} 2>/dev/null || true
        fi
		toggle::cleanup
		return
	fi

	( $1 || true; toggle::cleanup ) &

	if (( $? == 0 )); then
		echo $! > $pid
	fi
}


function toggle::cleanup() {
	 rm /var/run/user/${UID}/$(basename ${0}).pid || true
}


