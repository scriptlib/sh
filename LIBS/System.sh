#!/bin/bash
#File       : /share/shellscript/LIBS/System.sh
#Description: APPLIB for System
#Author     : duel
#Date       : Fri Mar 30 12:31:46 CST 2007

if [ -z "$APPLIB_SOURCE_System" ] ; then
    APPLIB_SOURCE_System=1
    
    source `APPLIB "AppMessage"`
    function TrySudo()
    {
        if ! "$@" ; then 
            APPWARN "Permission need to run "$@"\n"
            if sudo "$@" ; then
                return 0
            else
                return -1
            fi
        fi
    }
fi
