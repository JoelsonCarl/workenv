#!/bin/bash

if which vim > /dev/null; then
	rm -f "${HOME}/.vimrc"
	ln -s "$(pwd)/.vimrc" "${HOME}/.vimrc"
else
	echo "vim not found; not linking .vimrc"
fi

if which tmux > /dev/null; then
	rm -f "${HOME}/.tmux.conf"
	ln -s "$(pwd)/.tmux.conf" "${HOME}/.tmux.conf"
else
	echo "tmux not found; not linking .tmux.conf"
fi
