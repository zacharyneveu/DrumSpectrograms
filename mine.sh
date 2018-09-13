#!/bin/bash

rm -r images/*
rm -r audio/*

cd ./Raw_Audio
./scrape.sh kick
./scrape.sh snare
./scrape.sh hat
./scrape.sh tom
./scrape.sh perc
./scrape.sh bell
./scrape.sh clap
./scrape.sh crash
./scrape.sh ride

cd ../
./wavs-to-specs.sh
