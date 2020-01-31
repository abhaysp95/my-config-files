#!/bin/bash

echo "$time"

if [ -x "$filename" ]; then
	echo "File $filename exists."; cp $filename $filename.bak
else
	echo "File $filename not found."; touch filename
fi;echo "File test complete"
