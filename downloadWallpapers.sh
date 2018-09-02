#!/bin/bash

# store script directory for later reference
scriptDirectory=$(pwd)

# create directory for wallpaper data
rootDirectory=~/Sumit/automaticWall
if [ ! -d $directory ]; then
  mkdir $directory
fi;

# create directory for wallpaper data
bgDirectory=~/Sumit/automaticWall/bg

if [ ! -d $bgDirectory ]; then
  mkdir $bgDirectory
fi;

# get in the root directory
cd $rootDirectory

# url for reddit wallpapers
reddit="https://www.reddit.com/r/wallpapers/.json"


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
  wget --directory-prefix=$bgDirectory -A 'random' -nc -c $config
done

# set wallpaper randomly
# 1. change shell mod to executable
chmod +x $scriptDirectory/setWallpaper.sh
bash $scriptDirectory/setWallpaper.sh
