#!/bin/sh

export TERMINAL='st'
export EDITOR='nvim'

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi
