#!/bin/bash
#
# This script will install Vundle and other packages for things that
# Vundle will do (like syntax checking). It assumes the .vimrc is already
# updated to include all the Vundle stuff.

# Download and install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install various syntax checkers
## AsciiDoc
sudo apt install asciidoc
sudo apt install asciidoctor
## C
sudo apt install clang-tidy
## JSON
### jsonlint needs npm
sudo apt install npm
sudo npm install -g jsonlint
## Python
sudo apt install pylint
## Sh
sudo apt install shellcheck
