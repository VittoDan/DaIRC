#!/bin/sh
while getopts "b" opt; do 
    case $opt in 
        b)
        docker build --no-cache -t  dalitest1 .
        ;;
    esac
done
docker run --hostname "test" -it dalitest1:latest