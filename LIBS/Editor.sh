#!/bin/bash

if [ -z "$APPLIB_SOURCE_Editor" ] ; then
    APPLIB_SOURCE_Editor=1

    function CONSOLE_EDITOR () 
    {
        vim "$@"
    }
    function GUI_EDITOR () 
    {
        gedit "$@"
    }
    function DEFAULT_EDITOR () 
    {
        CONSOLE_EDITOR "$@"
    }
fi


