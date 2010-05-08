#!/bin/sh
###batch_unrar v0.1
###     - batch_unrar
###     - Written by duel, 2009-12-08
###Usage:
###     batch_unrar
###Option:
###     -h Display help text
###Example:
###     batch_unrar
scripthelp "$0" "$@" && exit 0
if [ -z "$1" ] ; then scripthelp "$0" "--help" ; exit 0 ; fi

for i in "$@" ; do
    unzip -v "$i"
done
