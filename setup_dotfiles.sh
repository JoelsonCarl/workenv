#!/bin/bash

which screen > /dev/null
if [ $? -eq 0 ]; then
	rm -f "${HOME}/.screenrc"
	ln -s "$(pwd)/.screenrc" "${HOME}/.screenrc"
else
	echo "screen not found; not linking .screenrc"
fi

which vim > /dev/null
if [ $? -eq 0 ]; then
	rm -f "${HOME}/.vimrc"
	ln -s "$(pwd)/.vimrc" "${HOME}/.vimrc"
else
	echo "vim not found; not linking .vimrc"
fi
