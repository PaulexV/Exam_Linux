#!/bin/bash

IN="/tmp/in"
OUT="/tmp/out"

if [ -d "!$IN" ]; then
	exit 3
	echo "The in folder does not exist." 
else
	if [ -d "!$OUT" ]; then
		mkdir /tmp/out 
	fi

	gzip -r /tmp/in/ 

	cp /tmp/in/* /tmp/out/
fi
