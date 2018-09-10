#!/bin/bash

SID="/usr/share/autowalls/"
WDD="/usr/lib/autowalls/"

reddit="https://www.reddit.com/r/wallpapers/top/.json"

cd $scriptDirectory

#REQUEST
#keep requesting until data is received

i=0
while [ $i -lt 1 ]
do
  curl  -A 'random' $reddit > data.json
  i=$(jq '.data.children | length' data.json)
done

# find all image url and store in a variable as array
mapfile -t configArr < <(jq -c -r '.data.children[].data.preview.images[0].source.url'  < data.json)

# for each url download image
for config in "${configArr[@]}"; do
  wget --directory-prefix=$WDD/reddit -A 'random' -nc -c $config
done

# set wallpaper randomly
# 1. change shell mod to executable
echo "dir $scriptDirectory"
#chmod +x $scriptDirectory/setWallpaper.sh
#bash $scriptDirectory/setWallpaper.sh
