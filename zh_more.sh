#!/bin/sh
cat "$@" | iconv -f gb2312 -t utf8 | more
