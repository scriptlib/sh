#!/bin/sh
upath=`cygpath -u "$SYSTEMROOT/system32/WindowsPowerShell/v1.0/powershell.exe"`
exec "$upath" "$@"

