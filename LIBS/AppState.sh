#!/bin/bash
#File       : /share/shellscript/LIBS/AppState.sh
#Description: APPLIB for AppState
#Author     : xiaoranzzz
#Date       : Mon Aug 13 16:10:54 CST 2007

if [ -z "$APPLIB_SOURCE_AppState" ] ; then
    APPLIB_SOURCE_AppState=1
    if [ -z "$APP_DATA" ] ; then
        source `APPLIB AppEnviron`
    fi
    APP_STATE_DIR="$APP_DATA/AppState"
    [ -d "$APP_STATE_DIR" ] || mkdir "$APP_STATE_DIR"
    function GetStateFile()
    {
        echo "$APP_STATE_DIR/$1"
    }
    function SaveState() 
    {
        [ -z "$1" ] && return
        CALLER=$1
        STATEFILE=`GetStateFile ${CALLER}`
        shift
        while [ -n "$1" ] ; do
            echo "$1" >> "$STATEFILE"        
            shift
        done
    }
    function RestoreState()
    {
        [ -z "$1" ] && return 
        [ -z "$2" ] && return
        CALLER=$1
        STATEFILE=`GetStateFile "$CALLER"`
        shift
        if [ ! -f "$STATEFILE" ] ; then
            while [ -n "$1" ] ; do
                echo "$1"
                shift
            done
            return
        fi
        declare -a LINES
        declare -i Index=0
        declare -i Count=0
        while cat "$STATEFILE" | read -s LINE ; do
            LINES[$Count]="$LINE"
            (( Count++ ))
        done
        echo Count=$Count
        while [ -n "$1" ] ; do
            ARGS=$1
            shift
            Index=0
            Match="no"
            while (( Index < Count )) ; do
                CURLINE="${LINES[$Index]}"
                (( Index++ ))
                if [ "$ARGS" == "$CURLINE" ] ; then
                    Match="yes"
                    break
                fi
            done
            if [ "$Match" == "no" ] ; then
                echo "$ARGS"
            fi
        done
    }
fi
