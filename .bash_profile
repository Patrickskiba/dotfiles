#!/bin/sh

export TERMINAL='st'
export EDITOR='nvim'

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi
