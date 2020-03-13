#!/bin/bash

# Basic packages
sudo apt-get install sed make binutils build-essential gcc g++ bash patch \
	gzip bzip2 perl tar cpio unzip rsync file bc wget

# Configuration interface and source tools
sudo apt-get install libncurses5 libncurses5-dev cvs git mercurial rsync \
	subversion

# Documentation and graph generation
sudo apt-get install asciidoc w3m dblatex graphviz python-matplotlib
