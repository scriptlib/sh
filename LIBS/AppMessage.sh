#!/bin/bash
if [ -z "$APPLIB_SOURCE_AppMessage" ] ; then
    APPLIB_SOURCE_AppMessage=1

    NOR=;BOLD=;RED=;YEL=;GRE=
    NOR="\033[0m";BOLD="\033[1m";RED="\033[91m";YEL="\033[93m";GRE="\033[92m"
    APPMSG() 
    {
        if [ -n "$*" ] ; then
            echo -ne "$GRE$@$NOR"
        fi
    }
     APPSUBMSG() 
    {
        if [ -n "$*" ] ; then
            echo -ne "\t$GRE$@$NOR"
        fi
    }
     APPWARN() 
    {
        if [ -n "$*" ] ; then
            echo -ne "$YEL$@$NOR"
        fi
    }
     APPERROR()
    {
        if [ -n "$*" ] ; then
            echo -ne "$RED$@$NOR" >&2
        fi
    }
fi


