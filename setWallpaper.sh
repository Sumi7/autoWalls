#!/bin/bash

imagesDir=~/Sumit/automaticWall/bg

# find a random fle from folder
files=($imagesDir/*)
gsettings set org.gnome.desktop.background picture-uri "file://${files[RANDOM % ${#files[@]}]}"
