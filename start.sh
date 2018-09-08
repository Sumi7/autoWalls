# !/bin/bash

# set service name
SERVICE_NAME=autoWalls

# start service
start(){
    echo "starting autoWalls"
    /home/sumit/Sumit/learning-area/Projects/autoWalls/downloadWallpapers.sh
}

# stop service    
stop() {
    echo "stopping autoWalls"
    pkill downloadWallpapers
}

# main
case "$1" in
    start)
        start
        ;;
    stop)
        stop 
        ;;
    restart|reload)
        stop
        start
        ;;
    *)
esac

exit 0