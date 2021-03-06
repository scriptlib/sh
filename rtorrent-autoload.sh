#!/bin/sh
###r-open-torrent v0.1
###     - add torrent to queue
###     - Written by duel, 2008-05-04
###Usage:
###     r-open-torrent
###Option:
###     -h Display help text
###Example:
###     r-open-torrent
scripthelp "$0" "$@" && exit 0
if [ -z "$1" ] ; then scripthelp "$0" "--help" ; exit 0 ; fi

btdir=~/bittorrent
[ -d "$btdir" ] || mkdir -p "$btdir"
backupd="$btdir/torrents/backup"
[ -d "$backupd" ] || mkdir -p "$backupd"
autoloadd="$btdir/torrents/autoload"
[ -d "$autoloadd" ] || mkdir -p "$autoloadd"

if ps -A | grep -q '\<deluge\>' ; then
    deluge "$@"
fi

prefix=`date "+%y%m%d%H%M%S"`;
prefix="$prefix";

zenity="zenity --title r-open-torrent --timeout=5"
append_text="\n____________________________________\n\ndialog will closed in 5 seconds"

function msgbox {
    $zenity --info --text "$*\n$append_text"
}

function alert {
    $zenity --error --text "$*\n$append_text"
}

while [ -n "$1" ] ; do
    if [ -f "$1" ] ; then
        fn=`basename "$1" .torrent`
        for dst in $backupd $autoloadd ; do
            cp -v -- "$1" "$dst/$prefix-$fn.torrent"
        done
        msgbox "$1\n------>\n$backupd\n$autoloadd"
    else
        alert "File not exists:\n\"$1\""
    fi
    shift
done
