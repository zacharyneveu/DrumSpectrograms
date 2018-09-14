#!/bin/bash

train_pct=$1
test_pct=$2
valid_pct=$3

if [ $# -lt "2" ]; then
	echo "Usage: ./divide.sh <train %> <test %> <validation %>"
	exit 1
fi

rm -r ./divided

mkdir ./divided
mkdir ./divided/train
mkdir ./divided/valid
mkdir ./divided/test

cd ./audio

for dir in ./*/
do
	mkdir ../divided/train/$dir
	mkdir ../divided/valid/$dir
	mkdir ../divided/test/$dir

	count=$(ls -1 $dir | wc -l)
	echo "type: $dir, samples: $count"

	train_count=$(expr $train_pct \* $count / 100)
	for file in $(ls $dir | sort -R | tail -$train_count); do
		cp "$dir/$file" ../divided/train/$dir
	done

	test_count=$(expr $test_pct \* $count / 100)
	for file in $(ls $dir | sort -R | tail -$test_count); do
		cp "$dir/$file" ../divided/test/$dir
	done

	valid_count=$(expr $valid_pct \* $count / 100)
	for file in $(ls $dir | sort -R | tail -$valid_count); do
		cp "$dir/$file" ../divided/valid/$dir
	done
done
