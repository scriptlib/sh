#!/bin/bash
#File       : /share/shellscript/LIBS/Debug.sh
#Description: APPLIB for Debug
#Author     : duel
#Date       : Thu Mar 29 23:49:29 CST 2007

if [ -z "$APPLIB_SOURCE_Debug" ] ; then
    APPLIB_SOURCE_Debug=1
    function PRINTVAR()
    {
        for i in "$@" ; do
            VARNAME=$i
            VARVALUE=${!i}
            echo "$VARNAME=$VARVALUE" 
            done
    } >&2
fi
