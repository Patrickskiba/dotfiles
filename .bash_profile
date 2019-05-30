#!/bin/sh

export TERMINAL='st'
export EDITOR='nvim'
export BROWSER='firefox'

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$HOME/.gem/ruby/2.6.0/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi
