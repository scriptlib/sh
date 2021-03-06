#!/bin/sh
###exec64 v0.1
###     - exec64
###     - Written by xiaoranzzz <xiaoranzzz@MYPLACE>, 2019-01-05 00:52
###Usage:
###     exec64 <64 bit executable> <failed safe executable>

a1=$1
shift
a2=$1
shift
if [ -z "$a1" ] ; then
	echo 'Usage $0 <64 bit executeable> <32 bit executable> [arguments...]'
	exit 0
fi

if [ -z "$a2" ] ; then a2=$a1 ; fi

if [ "$PROCESSOR_ARCHITECTURE" == 'AMD64' ] ; then
	a=$a1
else
	a=$a2
fi
exec $a "$@"

