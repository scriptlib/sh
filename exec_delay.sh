#!/bin/sh
###exec_delay v0.1
###     - exec_delay
###     - Written by xiaoranzzz <xiaoranzzz@MyPlace>, 2016-08-16 23:36
###Usage:
###     exec_delay
###Option:
###     -h Display help text
###Example:
###     exec_delay -h

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

sleep $1
shift
exec "$@"&


