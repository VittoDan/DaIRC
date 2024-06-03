#!/bin/sh
while getopts "b" opt; do 
    case $opt in 
        b)
        docker build --no-cache -t  dalitest1 .
        ;;
    esac
done
docker run --hostname "test" \
 -p 127.0.0.1:8080:8080\
 -p 127.0.0.1:9090:9090\
 -p 127.0.0.1:9091:9091\
 -p 127.0.0.1:9001:9001\
 -it dalitest1:latest