#!/bin/bash


function dnd() {
	v=$(gsettings get org.gnome.desktop.notifications show-banners)
	gsettings set org.gnome.desktop.notifications show-banners $([ "$v" == "true" ] && echo false || echo true)
}


function noise() {
	pid=/var/run/user/$UID/noise.pid
	if [ -f $pid ];then
		kill $(cat $pid)
		rm $pid
		return
	fi
	nohup play -n synth brownnoise synth brownnoise mix synth sine amod 0 &
	echo $! > $pid
}

function remove_unknown_ssh() {
    if [[ "$#" -lt 1 ]]; then
        echo "missing ip (or segment of it) to remove from known_hosts"
        return 1
    fi
    sed "/${1}/d" -i ~/.ssh/known_hosts
}
