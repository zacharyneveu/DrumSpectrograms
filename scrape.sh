#!/bin/bash
################################################################################
#
# Recursively finds files with pattern in their name and copies them to a 
# Directory named by that word.
#
################################################################################

pattern=$1
mkdir sorted/${pattern}

if [ $# -lt 1 ]; then
	echo "Usage: ./scrape.sh <pattern>"
	exit 1
fi

find . -iname "*${pattern}*.wav" -type f -exec cp {} ./sorted/${pattern}/ \;

cp ./number.sh sorted/
./sorted/number.sh ${pattern}
