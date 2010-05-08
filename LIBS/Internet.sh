#!/bin/bash
#File       : /share/shellscript/LIBS/Internet.sh
#Description: APPLIB for Internet
#Author     : duel
#Date       : Thu Mar 29 23:36:37 CST 2007

if [ -z "$APPLIB_SOURCE_Internet" ] ; then
    APPLIB_SOURCE_Internet=1
    
    function CURL()
    {
        curl -A "Mozilla/5.0" --progress-bar -m 180 --connect-timeout 60 --retry 10 "$@"
    }
    functin WGET()
    {
        wget -e "robots=off" -U "Mozilla/5.0" --restrict-file-names=windows "$@"
    }
    function DOWNLOAD()
    {
        CURL "$@"
    }
fi
