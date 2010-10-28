#!/bin/bash
#File       : /share/shellscript/LIBS/FileSystem.sh
#Description: APPLIB for FileSystem
#Author     : duel
#Date       : Fri Mar 30 02:56:27 CST 2007

if [ -z "$APPLIB_SOURCE_FileSystem" ] ; then
    APPLIB_SOURCE_FileSystem=1
    function DELETEFILE() 
    {
        for FILENAME in "$@" ; do
            if [ -z "$FILENAME" ] ; then exit 0 ; fi
            if [ -L "$FILENAME" ] ; then
                rm -vi "$FILENAME"
            elif [ ! -f "$FILENAME" ] ; then
                APPWARN "$FILENAME not exists.\n"
                exit -1
            elif [ ! -O "$FILENAME" ] ; then
                APPWARN "Permissions need to delete $FILENAME\n"
                sudo rm -vi "$FILENAME"
            else
                rm -vi "$FILENAME"
            fi
        done
    }
fi
