#!/bin/bash

IN="/tmp/in"
OUT="/tmp/out"
LOCK="/tmp/out/lock"


if [ ! -d "$IN" ]; then
	echo "The in folder does not exist." 
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
		for files in /tmp/in/*; do
			if [[ -f $files && -r $files ]]; then
				gzip $files
				mv $files.gz /tmp/out/
			else
				exit 1
			fi
		done
	rm /tmp/out/lock
	fi
fi
