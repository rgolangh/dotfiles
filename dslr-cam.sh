#!/bin/bash -ex

SCRIPT_DIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

function app() {
	trap 'cleanup; kill 0 2>/dev/null' EXIT

	if ! gphoto2 --auto-detect | grep -q "usb:"; then
		echo "Error: No camera detected. Connect your DSLR and try again."
		return 1
	fi

	echo "Starting DSLR camera stream via PipeWire..."

	gphoto2 --stdout --capture-movie \
		| gst-launch-1.0 fdsrc fd=0 ! \
		  jpegparse ! jpegdec ! videoconvert ! videorate ! \
		  "video/x-raw,format=I420,framerate=30/1" ! \
		  pipewiresink stream-properties="p,media.class=Video/Source,media.role=Camera,node.name=DSLR_Camera,node.description=DSLR_Camera"
}

function cleanup() {
	echo "Stopped DSLR camera stream."
}

source "$SCRIPT_DIR/toggle-helper.sh"
toggle app
