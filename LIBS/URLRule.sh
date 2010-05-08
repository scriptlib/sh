#!/bin/bash
#File       : /share/shellscript/LIBS/URLRule.sh
#Description: APPLIB for URLRule
#Author     : xiaoranzzz
#Date       : Fri Mar 30 20:21:43 CST 2007

if [ -z "$APPLIB_SOURCE_URLRule" ] ; then
    APPLIB_SOURCE_URLRule=1
    
    URLRULE_OPTION="U:URL to apply rules|L:For links|P:For pages|S:For sites|I:For image|H:For html|T:For text"
    if [ -n "$APPOPTION" ] ; then
        APPOPTION="$APPOPTION|$URLRULE_OPTION"
    else
        APPOPTION="$URLRULE_OPTION"
    fi

    source `APPLIB "AppUsage"` || exit -1

    URLRULEBASE="/share/shellscript/URLRules"

    URL_IMGLINK_RULES="$URLRULEBASE/IMGLINK"
    URL_IMGPAGE_RULES="$URLRULEBASE/IMGPAGE"
    URL_IMGSITE_RULES="$URLRULEBASE/IMGSITE"

    URL_HTMLLINK_RULES="$URLRULEBASE/HTMLLINK"
    URL_HTMLPAGE_RULES="$URLRULEBASE/HTMLPAGE"
    URL_HTMLSITE_RULES="$URLRULEBASE/HTMLSITE"

    URL_TEXTLINK_RULES="$URLRULEBASE/TEXTLINK"
    URL_TEXTPAGE_RULES="$URLRULEBASE/TEXTPAGE"
    URL_TEXTSITE_RULES="$URLRULEBASE/TEXTSITE"

    URLRULE_TYPE="IMG"
    URLRULE_LEVEL="LINK"

    APPOPT "P" "$@" >/dev/null && URLRULE_LEVEL="PAGE"
    APPOPT "S" "$@" >/dev/null && URLRULE_LEVEL="SITE"
    APPOPT "H" "$@" >/dev/null && URLRULE_TYPE="HTML"
    APPOPT "T" "$@" >/dev/null && URLRULE_TYPE="TEXT"
    URLRULE_URL=`APPOPT "U" "$@"`
    [ -z "$URLRULE_URL" ] && URLRULE_URL=${!#}
    if echo "ABC$URLRULE_URL" | grep -q "^ABC-" ; then URLRULE_URL="" ; fi

    URLRULE_PATH="URL_${URLRULE_TYPE}${URLRULE_LEVEL}_RULES"
    URLRULE_PATH="${!URLRULE_PATH}"

 
fi
