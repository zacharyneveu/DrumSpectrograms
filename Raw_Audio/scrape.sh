#!/bin/bash
################################################################################
#
# Recursively finds files with pattern in their name and copies them to a 
# Directory named by that word.
#
################################################################################

pattern=$1
to_dir=../audio
mkdir ${to_dir}/${pattern}

if [ $# -lt 1 ]; then
	echo "Usage: ./scrape.sh <pattern>"
	exit 1
fi

find . -iname "*${pattern}*.wav" -type f -exec cp {} ${to_dir}/${pattern}/ \;

cp ./number.sh ${to_dir}
cd ${to_dir} && ./number.sh ${pattern}
cd ../Raw_Audio
