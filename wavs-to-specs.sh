#!/bin/bash

################################################################################
#	
#	__          __               _           _____                     
#	\ \        / /              | |         / ____|                    
#	 \ \  /\  / /_ ___   _____  | |_ ___   | (___  _ __   ___  ___ ___ 
#	  \ \/  \/ / _` \ \ / / __| | __/ _ \   \___ \| '_ \ / _ \/ __/ __|
#	   \  /\  / (_| |\ V /\__ \ | || (_) |  ____) | |_) |  __/ (__\__ \
#	    \/  \/ \__,_| \_/ |___/  \__\___/  |_____/| .__/ \___|\___|___/
#						      | |                  
#						      |_|                  
#
#	This script recursively creates spectrograms for a nested audio dataset
#	in .wav format.
#
################################################################################
shopt -s globstar

rm -r ./images
cp -r ./audio ./images
img_width=299
img_height=299

for file in ./images/**/*.wav;
do
    outfile="${file%.*}.png"
    sox "$file" -n spectrogram -y $img_height -x $img_width -o "$outfile" -r -h
    echo "$file->$outfile"
done

rm -r images/**/*.wav
rm -r images/**/*.WAV
