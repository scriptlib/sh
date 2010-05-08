#!/bin/bash
if [ -z "$APPLIB_SOURCE_AppUsage" ] ; then
    APPLIB_SOURCE_AppUsage=1
    
    . `APPLIB "AppMessage"` || exit -1
    Src="$0"
    APPHELP()
    {
        plhelp "$Src" "-h"
#        APPMSG "$APPNAME V$APPVER\n"
#        [ -n "$APPDESC" ] && APPMSG "\t$APPDESC\n"
#        [ -n "$APPUSAGE" ] && APPMSG "Usage:\n\t$APPNAME $APPUSAGE\n"
#       
#        if [ -n "$APPOPTION" ] ; 
#            then APPMSG "Options:\n"
#            local IFS="|"
#            for i in $APPOPTION ; do
#                OPTNAME=`expr + "$i" : "\(.*\):"`
#                OPTDESC=`expr + "$i" : ".*:\(.*\)"`
#                APPMSG " -$OPTNAME\t$OPTDESC\n"
#            done
#        fi
#    	
#        [ -n "$APPEXAMPLE" ] && APPMSG "Example:\n\t$APPEXAMPLE\n"
#        APPMSG "(Written by $APPAUTHOR AT $APPDATE)\n"
    }      

    DEFAULT_EDITOR="vim"

    APPOPT()  {
        OPT="-$1"
        shift
        while [ -n "$1" ] ; do
            if [ "$OPT" = "$1" ] ; then
                shift
                OPTSTR="$1"
                if [ -n "$OPTSTR" ] ; then
                    if  expr + "$OPTSTR" : '-' >/dev/null ; then
                        echo "true"
                    else
                        echo "$OPTSTR"
                    fi
                else
                    echo "true"
                fi
                return 0
            else
                shift
            fi
        done
        return 1
    }

    DEFAULTOPT="h:Display this text|e:Edit me"
    if [ -z "$APPOPTION" ] ; then
        APPOPTION="$DEFAULTOPT"
    else
        APPOPTION="$DEFAULTOPT|$APPOPTION"
    fi

    if APPOPT "h" "$@" >/dev/null ; then 
        APPHELP 
        exit 0
    fi
    if APPOPT "e" "$@" >/dev/null ; then "$DEFAULT_EDITOR" "$0" ; exit 0 ; fi
    
fi
    
    
    
    
