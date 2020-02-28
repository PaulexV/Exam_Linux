#!/bin/bash

IN="/tmp/in"
OUT="/tmp/out"
LOCK="/tmp/out/lock"


touch /tmp/out/lock

if [ -d "!$IN" ]; then
	exit 3
	echo "The in folder does not exist." 
else
	if [ -d "!$OUT" ]; then
		mkdir /tmp/out 
	fi
	if [ -f "$LOCK" ]; then
		exit 22
		echo "The script is already in use"
	else
		gzip -r /tmp/in/ 
		cp /tmp/in/* /tmp/out/
		rm /tmp/out/lock
	fi
fi
