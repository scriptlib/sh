#!/bin/sh
###taskspool v0.1
###     - taskspool
###     - Written by xiaoranzzz <xiaoranzzz@MyPlace>, 2016-05-07 23:24
###Usage:
###     taskspool
###Option:
###     -h Display help text
###Example:
###     taskspool -h


DP="d:\\System Volume Information\\datapool"
DPTODO="$DP\\todo"
TASKPOOL="$DPTODO\\taskspool"

if [ -z "$@" ] ; then
	exec cygwin.bat --no-login "$TASKPOOL" taskspool
else
	for i in "$@" ; do
		cygwin.bat --no-login "$TASKPOOL\\$i" $i
	done
fi


