#!/bin/bash

################################################################################
#	Gets average image for a class (must all be the same size)
################################################################################

if [ $# -ne 1 ]; then
	echo "Usage: ./avg_img.sh <class>"
	exit 1
fi

class=$1
width=299
height=299
dims="${width}x${height}"

for img in ./images/$class/*.png; do
	img_dims=$(identify -format "%wx%h" $img)
	if [ "$img_dims" != "$dims" ]; then
		mv $img ${img%.*}.PNG
	fi
done

mkdir averages
gm convert -average ./images/$class/*.png ./averages/${class}_average.png

for img in ./images/$class/*.PNG; do
	mv $img ${img%.*}.png
done
