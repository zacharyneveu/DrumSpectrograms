#!/bin/bash

mkdir ./images/
mkdir ./audio/

rm -r ./images/*
rm -r ./audio/*

types=( kick snare rim hat tom perc bell clap crash ride shake cymbal )

cd ./Raw_Audio
for type in "${types[@]}"
do
	./scrape.sh $type
done

cd ../
./to_mono.sh
./wavs-to-specs.sh
./divide.sh 60 20 20

for type in "${types[@]}"
do
	./avg_img.sh $type
done
