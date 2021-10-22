#!/bin/bash -ex

# This scripts enables a a toggle on/off of a virtual camera. Combining with dslr-cam.desktop
# launcher makes it even more convenient.



function app() {
	# this makes sure we kill all child process when the app exists
	trap 'kill $(jobs -p)' EXIT
	device=${1-/dev/video0}
	echo "Using device $device"

	# Create a virtual video device using this kernel module
	$(dirname $(readlink -f "$0"))/virtual-video-dev.sh

	gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 "$device" &> /dev/null
}


source $(dirname $(readlink -f ${BASH_SOURCE[0]}))/toggle-helper.sh
toggle
