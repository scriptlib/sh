#!/bin/bash
#File       : /share/shellscript/LIBS/ScriptDef.sh
#Description: APPLIB for ScriptDef
#Author     : duel
#Date       : Fri Mar 30 01:09:50 CST 2007

if [ -z "$APPLIB_SOURCE_ScriptDef" ] ; then
    APPLIB_SOURCE_ScriptDef=1
    if [ -z "$XR_SHELL_SOURCE_DIR" -o -z "$XR_SHELL_BINARY_DIR" ] ; then
        echo "\$XR_SHELL_SOURCE_DIR or \$XR_SHELL_BINARY_DIR not setup">&2
    fi
    SCRIPTEXT="sh"
    SCRIPTDIR="$XR_SHELL_SOURCE_DIR"
    SCRIPTBINDIR="$XR_SHELL_BINARY_DIR"
    SCRIPTTEMPLATE="$SCRIPTDIR/LIBS/Template.sh"

    function LOCATESCRIPT() 
    {
        local SFILE=`basename "$1"`
        SFILE="$SCRIPTDIR/$SFILE"
        if [ ! -f "$SFILE" ] ; then 
            SFILE="$SFILE.$SCRIPTEXT"
        fi
        if [ ! -f "$SFILE" ] ; then 
            echo "$1 not found." >&2
            return 1 
        else
            echo "$SFILE"
            return 0
        fi
    }
    function LOCATELINK()
    {
        local SFILE=`LOCATESCRIPT "$1" 2>/dev/null`
        if [ -n "$SFILE" ] ; then
            SFILE=`basename "$SFILE"`
            find "$SCRIPTBINDIR/" -lname "*/$SFILE" 2>/dev/null
        else
            return 1
        fi
    }   
fi


