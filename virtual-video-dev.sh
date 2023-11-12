#!/bin/bash -ex

# compile and install the module.
function installModule() {
    echo -e "
    install v4l2loopback for your distrubution. For fedora
    install rpmfusion-free repo and then install the
    'kmod-v4l2loopback' package. This looks similar on other platform.
    If you don't have a packge then compile from sources:

      git clone https://github.com/umlaeute/v4l2loopback
	  cd v4l2loopback
	  make clean
	  make
	  sudo make install
    "
}

# if the module fails to load it most probably means
# it needs to be built and install to the current kernel

# modinfo v4l2loopback || installModule

# Create a virtual video device using this kernel module
sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 devices=4
echo "Loaded kernel module"


