#!/bin/bash

# Here enlightenment is kept as default
session=${1:-enlightenment}

case $session in
    awesome           ) exec awesome;;
    bspwm             ) exec bspwm;;
    catwm             ) exec catwm;;
    cinnamon          ) exec cinnamon-session;;
    dwm               ) exec dwm;;
    enlightenment     ) exec
			if [ ! -d "~/.e.backup" ]; then
			    mkdir ~/.e.backup
			fi
			find ~/.e.backup/*.tar.gz -mtime +5 -exec rm {} \;
			TODAY_BACKUP=~/.e.backup/`date +%Y-%m-%d`.e.tar.gz
			if [ ! -f "$TODAY_BACKUP" ]; then
			    tar -czvf $TODAY_BACKUP ~/.e
			fi
			enlightenment_start
			;;
    ede               ) exec startede;;
    fluxbox           ) exec startfluxbox;;
    gnome             ) exec gnome-session;;
    gnome-classic     ) exec gnome-session --session=gnome-classic;;
    i3|i3wm           ) exec i3;;
    icewm             ) exec icewm-session;;
    jwm               ) exec jwm;;
    kde               ) exec startkde;;
    mate              ) exec mate-session;;
    monster|monsterwm ) exec monsterwm;;
    notion            ) exec notion;;
    openbox           ) exec openbox-session;;
    unity             ) exec unity;;
    xfce|xfce4        ) exec startxfce4;;
    xmonad            ) exec xmonad;;
    budgie            ) exec budgie-session;;
    # No known session, try to run it as command
    *) exec $1;;
    esac
