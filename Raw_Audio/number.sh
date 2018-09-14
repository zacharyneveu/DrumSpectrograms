#!/bin/bash

type=$1

# Catch both .wav and .WAV files
for i in $type/*.[wW][aA][vV]; do 
	new=$(printf "${type}_%04d.wav" "$a")
	mv -i -- "$i" "${type}/$new"
	let a=a+1
done
