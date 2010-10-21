#!/bin/sh
###r-curl v0.1
###     - r-curl
###     - Written by xiaoranzzz, 2010-10-18 22:51:35
###Usage:
###     r-curl
###Option:
###     -h Display help text
###Example:
###     r-curl

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



