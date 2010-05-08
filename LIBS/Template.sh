#!/bin/sh
###___APPNAME___ v0.1
###     - ___APPNAME___
###     - Written by ___AUTHOR___, ___DATE___
###Usage:
###     ___APPNAME___
###Option:
###     -h Display help text
###Example:
###     ___APPNAME___
scripthelp "$0" "$@" && exit 0
if [ -z "$1" ] ; then scripthelp "$0" "--help" ; exit 0 ; fi

