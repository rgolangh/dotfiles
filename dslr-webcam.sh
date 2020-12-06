#!/bin/bash -ex

device=${1-/dev/video2}
echo "Using device $device"

# Create a virtual video device using this kernel module
$(dirname $(readlink -f $0))/virtual-video-dev.sh

gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 $device
