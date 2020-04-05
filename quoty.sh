#!/bin/bash

folder=~/Pictures/1920x1080/
font=/usr/share/fonts/droid/DroidSerif-BoldItalic.ttf

pictur=$(find $folder -type f | shuf -n 1)
output=wall.jpg
RATIOX=16
RATIOY=9
RESOLUTION=$(identify $pictur | awk '{print $3}')
WIDTH=$(echo $RESOLUTION | awk -Fx '{print $1}')
HEIGHT=$(echo $RESOLUTION | awk -Fx '{print $2}')
PROPX=$((WIDTH / RATIOX * 2))
PROPY=$((HEIGHT / RATIOY))

convert -background '#00000000' -fill white -gravity center \
  -size ${PROPX}x${PROPY} -font $font \
  caption:"$(./quote.sh)" -bordercolor '#00000070' -border 30x20 \
  $pictur +swap -gravity northwest -geometry +50+50 -composite $output

feh --bg-scale $output
