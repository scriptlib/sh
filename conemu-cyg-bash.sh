#!/bin/sh
###conemu-cyg-bash.sh v0.1
###     - conemu-cyg-bash.sh
###     - Written by xiaoranzzz <xiaoranzzz@MYPLACE>, 2019-01-05 00:51
###Usage:
###     conemu-cyg-bash.sh
###Option:
###     -h Display help text
###Example:
###     conemu-cyg-bash.sh -h

export CHERE_INVOKING=1
sc=`which conemu_cygwin.bat`
exec64 "conemu64.exe" "conemu.exe" -cmd `cygpath -w "$sc"` --no-login


