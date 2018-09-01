#!/bin/bash

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

#fileName
fileName="img.jpg"

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
  # jq -r $config
  wget --directory-prefix=$bgDirectory -A 'random' -nc -c $config
done
