#!/bin/bash

type=$1

for i in $type/*.wav; do 
	new=$(printf "${type}_%04d.wav" "$a")
	mv -i -- "$i" "${type}/$new"
	let a=a+1
done
