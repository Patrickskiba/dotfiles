#!/bin/sh

export TERMINAL='xterm'
export BROWSER='brave'

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$HOME/.gem/ruby/2.6.0/bin"

[[ -f ~/.creds ]] && . ~/.creds

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

