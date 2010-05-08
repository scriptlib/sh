#!/bin/sh
###r-disable-services v0.1
###     - r-disable-services
###     - Written by root, 2010-02-16
###Usage:
###     r-disable-services
###Option:
###     -h Display help text
###Example:
###     r-disable-services
scripthelp "$0" "$@" && exit 0
if [ -z "$1" ] ; then scripthelp "$0" "--help" ; exit 0 ; fi
while [ -n "$1" ] ; do
	update-rc.d "$1" disable
	shift
done

