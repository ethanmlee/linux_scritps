#!/bin/sh

WIDTH=$(echo "$(xdpyinfo | grep dimensions | awk '{print $2}' | sed "s/x.*//" | tr -d '\n') - $(xrdb -query | grep 'dwm.gappih' | awk '{print $2}') * 2" | bc)
GAP=$(xrdb -query | grep 'dwm.gappih' | cut -f2)

FONT=$(xrdb -query | grep 'dwm.dmenufont' | cut -f2)
NB=$(xrdb -query | grep 'dwm.normbgcol' | cut -f2)
NF=$(xrdb -query | grep 'dwm.normfgcol' | cut -f2)
SB=$(xrdb -query | grep 'dwm.selbgcol' | cut -f2)
SF=$(xrdb -query | grep 'dwm.selfgcol' | cut -f2)

[ "$1" = "-s" ] && CMD="dmenu" || CMD="dmenu_run"

[ -n "$*" ] && shift

$CMD $@     \
-m 0        \
-x $GAP     \
-y $GAP     \
-z $WIDTH   \
-h 30       \
-fn "$FONT" \
-nb $NB     \
-nf $NF     \
-sb $SB     \
-sf $SF
