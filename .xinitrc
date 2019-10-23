#!/usr/bin/env bash 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -option caps:ctrl_modifier

exec i3
xset r rate 200 50
