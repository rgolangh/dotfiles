#!/bin/bash -ex

# compile and install the module.
function installModule() {
	cd $HOME/src/v4l2loopback
	make clean
	make
	sudo make install
}

# if the module fails to load it most probably means
# it needs to be built and install to the current kernel
modinfo v4l2loopback || installModule

# Create a virtual video device using this kernel module
sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 devices=4
echo "Loaded kernel module"


