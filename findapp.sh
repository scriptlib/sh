#!/bin/sh

testop="$1"
shift

appname="$1"
shift
appfolder="$1"
[ -n "$appfolder" ] && appfolder="$1/"
shift
apptype="$1"
[ -n "$apptype" ] && apptype="$1/"
shift


appdir1="$FS_SYSTEM_APP"
appdir2="/usr/bin"
appdir3="/myplace/lib"
appdir4="${FS_ROOT}appdata"
appdir5="/myplace/appdata"
appdir6="~"

if [ "$OSTYPE" = "cygwin" ] ; then
	appdir1=`cygpath -u "$FS_SYSTEM_APP"`
	appdir2=`cygpath -u "$PROGRAMFILES"` 
	appdir4=`cygpath -u "$FS_ROOT"`
	appdir4="${appdir4}appdata"
fi

appfull=
for exe in "$appname" ; do
	for d1 in "$appfolder" ; do
		for d2 in "$apptype" ; do
			for d3 in "$appdir1" "$appdir2" "$appdir3" "$appdir4" "$appdir5" "$appdir6" ; do
				ftest="$d3/$d2$d1$exe"
	#			echo -n "testing: $ftest" >&2
				if [ $testop "$ftest" ] ; then
	#				echo " [YES]" >&2
					appfull="$ftest"
					break
	#			else
	#				echo " [NO]" >&2
				fi
			done
			[ -n "$appfull" ] && break;
		done
		[ -n "$appfull" ] && break;
	done
	[ -n "$appfull" ] && break;
done

if [ -z "$appfull" ] ; then
	#echo "app not found: $appname" >&2
	exit 1
fi
echo $appfull


