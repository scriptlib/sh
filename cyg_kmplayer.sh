#!/bin/sh
###cyg_kmplayer v0.1
###     - cyg_kmplayer
###     - Written by xiaoranzzz <xiaoranzzz@MyPlace>, 2015-04-27 23:32
###Usage:
###     cyg_kmplayer
###Option:
###     -h Display help text
###Example:
###     cyg_kmplayer -h

function _need_help {
    while [ -n "$1" ] ; do
        for h in "-h" "-H" "--help" "--HELP" ; do [ "$1" == "$h" ] && return 0 ; done
        shift
    done
    return 1
}
function _format_help {
    while read -s line ; do
        if [ "${line:0:1}" == "#" ] ; then [ "${line:0:3}" == "###" ] && echo "${line:3}" ; else break ; fi
    done
}
function _help_me {
    _format_help <"$1" ; exit 0
}
_need_help "$@" && _help_me "$0"


file=$1
shift

if [ -n "$file" ] ; then
	"/myplace/system/app/multimedia/The KMPlayer/kmplayer.exe" "`cygpath -w $file`" "$@"&
else
	"/myplace/system/app/multimedia/The KMPlayer/kmplayer.exe" "$@"&
fi



