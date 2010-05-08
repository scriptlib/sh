#!/bin/bash
#Rules for www.kangdm.com
#http://www.kangdm.com/comic/3648/oh%E9%80%8F%E6%98%8E%E4%BA%BA%E9%97%B4%E7%AC%AC1%E5%8D%B7/
#Created by duel
#Date: Mon Mar 24 06:12:12 CST 2008

filter() {
    cat
#    htmllink "$1"
    return $?
}
URL="${1}index.js"
if [ -z "$URL" ] ; then
    filter
else
    netcat -u "$URL" | filter "$URL"
fi
