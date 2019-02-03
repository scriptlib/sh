#!/bin/sh
###play_delay v0.1
###     - play_delay
###     - Written by xiaoranzzz <xiaoranzzz@MyPlace>, 2016-08-14 22:18
###Usage:
###     play_delay
###Option:
###     -h Display help text
###Example:
###     play_delay -h

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
[ -z "$1" ] && _help_me "$0"

player="kmplayer.bat"

if [ -n "$2" ] ; then
	echo Wait $2 seconds
	wait $2
fi

exec "$player" "$1"

