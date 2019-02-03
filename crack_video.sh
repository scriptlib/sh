#!/bin/sh
###crack_video v0.1
###Usage:
###     crack_video <files...>
###Example:
###     crack_video file1 file2 file3 ... 

function recho {
	wd="$1"
	start="1$2"
	count=$3
	i=1
	n=$start
	while (($i<=$count)) ; do
		((n=$n+1))
		echo -n "$wd$n"
		((i=$i+1))
	done
}

for f in "$@" ; do 
	if [ -f "$f" ] ; then
		echo "  append words to $f:"
		recho "fuckbaiduyun" `date +%N` 1000 | dd iflag=binary oflag=append,binary conv=notrunc of="$f"
	else 
		echo "Skipped, File not exist: $f"
	fi
done

