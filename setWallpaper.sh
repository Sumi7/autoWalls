#!/bin/bash

imagesDir=~/Sumit/automaticWall/bg

# find a random fle from folder
files=($imagesDir/*)

# keep track of old background
previousBackground=""

# choose a random background image
randomBackground=file://${files[RANDOM % ${#files[@]}]}

# if previousBackground is same then reselect a file randomy until its different
while [ "$previousBackground" == "$randomBackground" ]
do
  randomBackground=file://${files[RANDOM % ${#files[@]}]}
done

# set backgrounds
gsettings set org.gnome.desktop.background picture-uri "$randomBackground"

#update previousBackground variable
previousBackground=$randomBackground
