#!/bin/bash

IN="/tmp/in"
OUT="/tmp/out"
LOCK="/tmp/out/lock"
EXIT=false

if [ ! -d "$IN" ]; then
	echo "/tmp/in does not exist." 
	exit 3
else
	if [ ! -d "$OUT" ]; then
		mkdir /tmp/out
	fi
	if [ -f "$LOCK" ]; then
		echo "The script is already in use"
		exit 22
	else
		touch /tmp/out/lock
		touch /tmp/out/log
		for files in /tmp/in/*; do
			if [[ -f $files && -r $files ]]; then
				gzip $files
				echo "$files has been handled" >> /tmp/out/log
				mv $files.gz /tmp/out/
			else
				echo "$files has failed to be handled" >> /tmp/out/log
				EXIT=true
			fi
		done
		rm /tmp/out/lock
		if [ "$EXIT"=true ]; then
				exit 1
		fi
	fi
fi
