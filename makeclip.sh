#!/bin/sh
###makeclip v0.1
###     - makeclip
###     - Written by duel, 2008-04-25
###Usage:
###     makeclip (file name) (start) (length) [clipName] [profile]
###Option:
###     -h Display help text
###Example:
###     makeclip abc.avi clip1
scripthelp "$0" "$@" && exit 0
if [ -z "$1" ] ; then scripthelp "$0" "--help" ; exit 0 ; fi


echo makeclip "$@" >>"makeclip.log"


fn=$1
ss=$2
endpos=$3
clip=$4
profile=$5

[ -z "$clip" ] && clip="clip1";
[ -z "$profile" ] && profile="avi";

bn=`basefname "$fn"`

if [ -z "$profile" ] ; then
    ext=wmv
else
    case "$profile" in 
        avi|havi)   ext=avi;;
        mp4|mpeg4)  ext=mp4;;
        wmv)        ext=wmv;;
        asf)        ext=asf;;
        3gp)        ext=3gp;;
        *)          ext=avi;;
    esac
fi

ofn="$bn-$clip.$ext"
comment=`date +%x`
exec mencoder "$fn" -o "$ofn" -ss "$ss" -endpos "$endpos" -info "name=$bn:comment=$comment:artist=$USER:copyright=$USER@$HOSTNAME" -profile $profile


