#!/bin/bash

###
# Script installation and wallpaper download directory
###
SID="/usr/share/autowalls/"
WDD="/usr/lib/autowalls/"

###
# Creating directories
###
mkdir -p $SID $WDD
mkdir -p $WDD/reddit/


###
# Installing scripts
###
case "$(uname -o)" in 
	"GNU/Linux")
	   cp ./setWallpaper.sh $SID
	   cp ./downloadWallpapers.sh $SID
	   cp ./autowalls.sh /etc/init.d/autowalls
           echo "Service installed successfully."
	;;
	*)
	   echo "ERROR: Not a supported system for now."
	;;
esac

