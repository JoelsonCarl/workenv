#!/bin/bash

function usage() {
	echo "This script will erase any existing folders."
	echo "(bsp, buildroot, linux, u-boot, builds)"
	echo "To use it, you MUST specify the argument -f."
	echo "Also assumes you have git installed."
	exit 1
}

if [ $# -lt 1 ]; then
	usage
fi
if [ "$1" != "-f" ]; then
	usage
fi

cd ~
mkdir -p work
cd work
rm -fr bsp buildroot linux linux-stable u-boot builds
mkdir bsp builds
git clone git://git.busybox.net/buildroot
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
git clone git://git.denx.de/u-boot.git
