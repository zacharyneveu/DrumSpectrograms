#!/bin/bash

################################################################################
#	Converts all audio files to mono from stereo
################################################################################

shopt -s globstar

for f in audio/**/*; do
	file $f | grep "stereo" > /dev/null
	is_stereo=$?
	if [ $is_stereo -eq 0 ]; then
		tempfile=${f%.*}_stereo.wav
		mv $f $tempfile
		sox $tempfile $f remix 1
		rm $tempfile
		echo "$f -> mono"
	fi
done
