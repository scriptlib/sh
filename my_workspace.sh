#!/bin/sh
###my_workspace v0.1
###     - my_workspace
###     - Written by xiaoranzzz <xiaoranzzz@myplace.hell>, 2015-08-12 02:11
###Usage:
###     my_workspace
###Option:
###     -h Display help text
###Example:
###     my_workspace -h

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
#[ -z "$1" ] && _help_me "$0"

prog=x-terminal-emulator

rootd=/myplace
xd=$rootd/.x
td=$xd/todo/taskspool

cd $td
$prog -title taskspoll&

cd $td/ladies
$prog -title ladies&

cd $td
$prog -title edit_source&

cd "$td/ladies/#Reposter"
$prog -title '#Reposter'&

cd "$xd/seeds"
$prog -title 'seeds'&


