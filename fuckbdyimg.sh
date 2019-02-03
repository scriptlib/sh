#!/bin/sh
a=$1
if [ -z "$1" ] ; then
       a=.
fi
exec find "$a" -type f -iname "*.jpg" -or -iname "*.bmp" -or -iname "*.gif" -or -iname "*.png" -print0 | xargs -0 fuckbdy

