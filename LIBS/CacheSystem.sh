#!/bin/bash
#File       : /share/shellscript/LIBS/CacheSystem.sh
#Description: APPLIB for CacheSystem
#Author     : xiaoranzzz
#Date       : Mon Sep 17 03:14:22 CST 2007

if [ -z "$APPLIB_SOURCE_CacheSystem" ] ; then
    APPLIB_SOURCE_CacheSystem=1
    APPLIB_CACHE_DIR="/tmp/myplace_cache"
    APPLIB_CACHE_LIST="$APPLIB_CACHE_DIR/keywords.list"
    APPLIB_CACHE_DEBUG=;
    
    function GetCachedFile() {
        [ -d "$APPLIB_CACHE_DIR" ] || return 1
        [ -f "$APPLIB_CACHE_LIST" ] || return 1
        [ -z "$1" ] && return 0;
        local EKEYWORD=${1//\//\\\/}
        EKEYWORD=${EKEYWORD//./\\.}
        local result=`grep -i "$EKEYWORD->" "$APPLIB_CACHE_LIST" | head -n 1`
        if [ -n "$result" ] ; then
            result=`expr + "$result" : ".*->\(.*\)$"`
        else
            return 1
        fi
        [ -f "$result" -a -r "$result" ] || return 1
        [ -n "$APPLIB_CACHE_DEBUG" ] && echo "[Cache System:]Get \"$result\" <= \"$1\"" >&2
        echo "$result"
        return 0
    }
    
    function SaveCache() {
	KEYWORD=${!#}
        CACHE_FILE=`GetCachedFile "$KEYWORD"`
        if [ -z "$CACHE_FILE" ] ; then
	    if [ ! -d "$APPLIB_CACHE_DIR" ] ; then
	        mkdir "$APPLIB_CACHE_DIR"
                chmod 775 "$APPLIB_CACHE_DIR"
	    fi
	    [ -f "$APPLIB_CACHE_LIST" ] || touch "$APPLIB_CACHE_LIST"
	    CACHE_FILE="$APPLIB_CACHE_DIR/"`stringdate`
            echo "$KEYWORD->$CACHE_FILE" >> "$APPLIB_CACHE_LIST" 
	fi
        [ -n "$APPLIB_CACHE_DEBUG" ] &&	echo "[Cache System:]New \"$KEYWORD\" => \"$CACHE_FILE\"" >&2 
        tee "$CACHE_FILE"
    }
    
    function LoadCache() {
        KEYWORD=${!#}
        CACHE_FILE=`GetCachedFile "$KEYWORD"`
        if [ -n "$CACHE_FILE" ] ; then 
            [ -n "$APPLIB_CACHE_DEBUG" ] && echo "[Cache System:]PrintOut \"$KEYWORD\" Begin" >&2
            echo "Using CACHED FILE:$CACHE_FILE" >&2
            cat "$CACHE_FILE"
            [ -n "$APPLIB_CACHE_DEBUG" ] && echo "[Cache System:]PrintOut \"$KEYWORD\" End" >&2
            return 0
        else
            return 1
        fi
    }

    function DeleteCache() {
        CACHE_FILE=`GetCachedFile "$1"`
        [ -n "$CACHE_FILE" -a -f "$CACHE_FILE" ] && rm "$CACHE_FILE"
        [ -f "$APPLIB_CACHE_FILE" -a -w "$APPLIB_CACHE_FILE" ] || return
        local EKEYWORD=${1//\//\\\/}
        EKEYWORD=${EKEYWORD//./\\.}
        sed -i -e "s/^$EKEYWORD->.*$//g" "$APPLIB_CACHE_LIST" 
    }

fi
