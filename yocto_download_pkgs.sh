#!/bin/bash

# Essential packages
# Packages needed to build an image on a headless system
sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
xz-utils debianutils iputils-ping

# Graphical and Eclipse Plug-In Extras
# Recommended if the host system has graphics support or if you are going to
# use the Eclipse IDE
sudo apt-get install libsdl1.2-dev xterm

# Documentation
# Needed if you are going to build out the Yocto Project documentation manuals
sudo apt-get install make xsltproc docbook-utils fop dblatex xmlto

# OpenEmbedded Self-Test (oe-selftest)
# Needed if you are going to run oe-selftest
sudo apt-get install python-git
