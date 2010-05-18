#!/bin/bash
#TEMPLATE BEGIN
APPNAME="batchget"
APPAUTHOR="duel"
APPDATE="2007-03-28"
APPVER="0.1"
APPDESC="Download URLS,using simget"
APPUSAGE=""
APPEXAMPLE="echo \"http://some.com/some/foo.jpg\" | batchget"
APPOPTION="M:Max number of simultanous tasks|J:Job Name|A:Auto rename|D:Create directories|E:Specify filename's EXT for auto rename|W:Working directory|R:Refer URL"

source `APPLIB "AppUsage"` || exit -1

ARGS=$*

MAXSIMDOWN=3
MINSIMDOWN=1
CREATEDIR=`APPOPT "D" "$@"`
AUTONAME=`APPOPT "A" "$@"`
FILEEXT=`APPOPT "E" "$@"`
JOBNAME=`APPOPT "J" "$@"`
MULDOWN=`APPOPT "M" "$@"`
WKD=`APPOPT "W" "$@"`
REFER=`APPOPT "R" "$@"`

if [ "$JOBNAME" == "true" ] ; then JOBNAME="" ; fi
if [ "$REFER" == "true" ] ; then REFER="" ; fi

if [ -n "$WKD" ] ; then
    mkdir "$WKD" 2>/dev/null
    cd "$WKD"
fi

[ -z "$MULDOWN" ] && MULDOWN=$MAXSIMDOWN
[ "$MULDOWN" -lt "$MINSIMDOWN" ] && MULDOWN=$MINSIMDOWN

declare -a URLS
declare -i Count=0
declare -i Index=0

while read -s URL ; do
    URLS[$Count]="$URL"
    (( Count++ ))
done

if [ -z "${URLS}" ] ; then exit 0 ; fi

APPMSG "\n$Count URLS enqueued\n"
#Main Loop
while (( Index < Count )) ; do
    URL="${URLS[$Index]}"
    ((Index++))
    CURJOBNAME="[${JOBNAME}$Index/$Count]"
    FILEPATH=""
    FILENAME=`basename "$URL"`
    [ -z "$FILEEXT" ] && FILEEXT=`extname "$URL"`
    [ -n "$AUTONAME" ] && FILENAME="`uniqname`$FILEEXT"
    [ -n "$CREATEDIR" ] && FILEPATH=`urlpath "$URL"`
    [ -n "$FILEPATH" ] && FILENAME="$FILEPATH/$FILENAME"
    if [ -z "$REFER" ] ; then
        THISREFER=$URL
    else
        THISREFER=$REFER
    fi
    simdo "$MULDOWN" download -u "$URL" -d -s "$FILENAME" -n "$CURJOBNAME" -r "$THISREFER"
done


