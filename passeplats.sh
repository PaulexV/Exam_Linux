#!/bin/bash

IN="/tmp/in"
OUT="/tmp/out"
LOCK="/tmp/out/lock"


touch /tmp/out/lock

if [ -d "!$IN" ]; then
	echo "The in folder does not exist." 
	exit 3
else
	if [ -d "!$OUT" ]; then
		mkdir /tmp/out 
	fi
	if [ -f "$LOCK" ]; then
		echo "The script is already in use"
		exit 22
	else
		gzip -r /tmp/in/ 
		cp /tmp/in/* /tmp/out/
		rm /tmp/out/lock
	fi
fi
