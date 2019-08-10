#!/usr/bin/env bash 

setxkbmap -option caps:ctrl_modifier

exec i3
xset r rate 200 50
