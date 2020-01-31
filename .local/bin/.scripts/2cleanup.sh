#!/bin/bash
#proper header for a Bash Script

#cleanup, version 2
#Insert code here to print error message and exit if not root.

LOG_DIR=/var/log
#variables are better than hard-coded values
cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp

echo "Logs cleaned up."

exit # The right and proper method of "exiting" from a script.
	# A bare "exit" (no parameter) returns the exit status
	#+ of the preceding command

