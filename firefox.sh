#!/bin/sh
###firefox v0.1
###     - firefox
###     - Written by xiaoranzzz <xiaoranzzz@MyPlace>, 2015-12-07 00:24
###Usage:
###     firefox
###Option:
###     -h Display help text
###Example:
###     firefox -h

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


app=firefox
if [ -n "$FS_ROOT" ] ; then
	appfull="$FS_SYSTEM_APP/internet/Mozilla Firefox/firefox.exe"
fi

if [ -z "$appfull" ] ; then
	for n in "firefox.exe" "firefox" ; do
		for d1 in "firefox" "Mozilla Firefox" ; do
			for d2 in "internet" "" ; do
				appfull=`findapp.sh -f "$n" "$d1" "$d2"`
				[ -n "$appfull" ] && break;
			done
			[ -n "$appfull" ] && break;
		done
		[ -n "$appfull" ] && break;
	done
fi

if [ -z "$appfull" ] ; then
	echo "Error location $app"
	exit 1
fi

if [ "$OSTYPE" == "cygwin" ] ; then
	appfull=`cygpath -u "$appfull"`
fi
echo $appfull

arg1=$1
shift

if [ -z "$arg1" ] ; then
	exec "$appfull" "$@"
	exit 0
elif [ "$arg1"  == "select" ] ; then
	exec "$appfull" -ProfileManager "$@"&
	exit 0
fi

if [ -n "$FS_ROOT" ] ; then
	profiled="$FS_ROOT/appdata/firefox/profiles"
fi

if [ -z "$profiled" ] ; then
	for d in "firefox" "Mozilla Firefox" ".mozilla/firefox" ; do
		profiled=`findapp.sh -d profiles "$d"`
		[ -n "$profiled" ] && break;
	done
fi

[ -z "$profiled" ] && profild="/myplace/appdata/firefox/profiles"

if [ "$OSTYPE" == "cygwin" ] ; then
	profile=`cygpath -w "$profiled/$arg1"`
	echo $profile
	exec "$appfull" -profile "$profile" "$@"&
else
	echo $profiled/$arg1
	exec "$appfull" -profile "$profiled/$arg1" "$@"&
fi

