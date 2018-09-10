#!/bin/bash
SID="/usr/share/autowalls/"

case "$1" in
    start)
        echo "Starting service..."
	;;
    stop)
        echo "Stoping service..."
    ;;
    init)
        echo "Initiating service..."
        /bin/bash $SID/downloadWallpapers.sh > /dev/null 2>&1 &
    ;;
    reload)
	   /bin/bash $SID/setWallpaper.sh
	   echo "Reloading service..."
    ;;
    *)
	   echo "Valid options can be start|stop|init|reload."
    ;;
esac
