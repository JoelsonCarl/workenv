#!/bin/bash

which vim > /dev/null
if [ $? -eq 0 ]; then
	rm -f "${HOME}/.vimrc"
	ln -s "$(pwd)/.vimrc" "${HOME}/.vimrc"
else
	echo "vim not found; not linking .vimrc"
fi

which tmux > /dev/null
if [ $? -eq 0 ]; then
	rm -f "${HOME}/.tmux.conf"
	ln -s "$(pwd)/.tmux.conf" "${HOME}/.tmux.conf"
else
	echo "tmux not found; not linking .tmux.conf"
fi
