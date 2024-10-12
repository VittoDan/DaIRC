#!/bin/sh
while getopts "b" opt; do 
    case $opt in 
        b)
        docker build -t  dalitest1 .
        ;;
    esac
done
docker run --hostname "test" \
 --ulimit nofile=90000:90000\
 -p 127.0.0.1:8080:8080\
 -p 127.0.0.1:9090:9090\
 -p 127.0.0.1:9091:9091\
 -p 127.0.0.1:9001:9001\
 -it dalitest1:latest \

 #Having all those ports mapped to the outside of the container is not necessary to the project to work, 
 #I'll leave them in case someone wants to do something with them :D 