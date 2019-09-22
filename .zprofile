#!/bin/sh

export TERMINAL='st'
export BROWSER='brave'

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$HOME/.gem/ruby/2.6.0/bin"

[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -f ~/.creds ]] && . ~/.creds

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

